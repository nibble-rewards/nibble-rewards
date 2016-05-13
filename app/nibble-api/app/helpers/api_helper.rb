module ApiHelper
  def validate_auth_token
    @resource = User.find_by_authentication_token(params[:auth_token] || request.headers["x-auth-token"])
    render :status => 401, :json => {errors: ['invalid auth token']} unless @resource
  end
end
