class Api::SessionsController < ApplicationController
  skip_before_filter :authenticate_user_from_token!, :only => :create
#  skip_before_filter :verify_signed_out_user, only: :destroy #bypass from stackoverflow on the error generated

  include Devise::Controllers::Helpers
  include ApiHelper

  respond_to :json

  before_filter :validate_auth_token, :except => :create

  # POST /api/v1/users/sign_in
  def create
    resource = User.find_for_database_authentication(:email => params[:user][:email])
    return failure unless resource #&& resource.active #this shall make use of the deactivated column

    if resource.valid_password?(params[:user][:password])
      sign_in(:user, resource)
      resource.ensure_authentication_token!
      render :json=> {:success => true, :id => resource.id, :user => resource.as_json}
      return
    end
    failure
  end

  # DELETE /api/v1/users/sign_out
  def destroy
    @resource = User.find_by_authentication_token(params[:auth_token] || request.headers["x-auth-token"])
    return render :status => 401, :json => {errors: ['invalid auth token']} unless @resource

    @resource.update_attributes(:authentication_token => nil) #dunno why the reset does nothing
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    render :status => 200, :json => params
  end


  def failure
    return render json: { success: false, errors: ['invalid credentials'] }, :status => :unauthorized
  end


end
