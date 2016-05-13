class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_filter :authenticate_user_from_token!, :if => Proc.new { |c| c.request.format == 'application/json' }

  private

  def authenticate_user_from_token!
    user_token = params[:user_token].presence || request.headers["x-auth-token"]
    user       = user_token && User.find_by_authentication_token(user_token.to_s)
    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
      return
    end
    failure

  end

  def failure
    return render json: { success: false, errors: ['invalid credentials'] }, :status => :unauthorized
  end
end
