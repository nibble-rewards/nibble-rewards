class Api::CampaignsController < ApplicationController
  def index
    render :json => Campaign.all
  end

  def show
    render :json => (Campaign.find(params[:id]) rescue error("cannot find campaign with id #{params[:id]}"))
  end

  def create
    #current user is actually a function 
    #that is meta programmed by devise GEM .. so for free
    #we get the merchant that the camaign belongs to
->() {
    current_user.create_campaign(:star_amount => 10,
                                 :mimimum_purchase => 10000,  # -> $100.00
                                 :item_name => 'generic mp3 player',
                                 :item_value => 1000)         # -> $20.00
}
    #that was my test within irb console so now lets try it here with massive assignment

    current_user.create_campaign(campaign_params)

    render :json => current_user.campaign.as_json, :status => 201  #we can return back anything or nothing with a status 201
                                                   #if we follow any standards 
    
  end

  def destroy
    #to be implimented
  end

  private

  def campaign_params
    params.require(:campaign).permit(:star_amount, :mimimum_purchase, :item_name, :item_value)
  end
  
  def error(msg)
    {error: msg}
  end
end
