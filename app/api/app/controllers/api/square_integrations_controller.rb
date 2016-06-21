class Api::SquareIntegrationsController < ApplicationController
  def index
    render :json => params
  end

  def show
    render :json => params
  end

  def create
    SquareIntegration.find_or_create_by(:user_id => 1)
                     .update_attributes(square_integration_params)

    #create a webhook guid
    #which will be added to the current_user model

    render :json => {
                      message: 'copy & paste this webhook into your square account webhook',
                      webhook: ['http://', request.host_with_port, '?', SecureRandom.hex].join('') 
                    }
  end
  
  def update
    render :json => params
  end

  def delete
    render :json => params
  end
  private

  def square_integration_params
    params.require(:square_integration).permit(:application_id, :access_token)
  end
  
  def error(msg)
    {error: msg}
  end

end
