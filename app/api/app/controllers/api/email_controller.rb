class Api::EmailController < ApplicationController
  #post
  def create
    email = {
      :from => CGI::unescape(params[:from]),
      :to => CGI::unescape(params[:to]),
      :subject => CGI::unescape(params[:subject]),
      :body => params[:body],
      :cc => CGI::unescape(params[:cc]),
      :bcc => CGI::unescape(params[:bcc])
    }
    message = 'email submitted'
    begin
      Reminder.reminder_email(email).deliver_now 
    rescue => e
      message = e
    end
    render :json => {:message => message}
  end
end
