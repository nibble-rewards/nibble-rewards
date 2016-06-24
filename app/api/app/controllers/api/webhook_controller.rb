class Api::WebhookController < ApplicationController
  #post from square up
  def create
    render :json => params
  end
end
