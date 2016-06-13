class Api::WebhookController < ApplicationController
  def create
    render :json => params
  end
end
