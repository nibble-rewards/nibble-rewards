class MainController < ApplicationController
  def index
    render :json => {:message => 'root'}
  end
end
