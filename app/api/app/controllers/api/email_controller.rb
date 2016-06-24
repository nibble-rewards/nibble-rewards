class Api::EmailController < ApplicationController
  #post
  def create

    renderer = Redcarpet::Render::HTML.new(no_links: false, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, :tables => true, :superscript => true, :strikethrough => true, :fenced_code_blocks => true) 
    #markdown.render(source)


    email = {
      :from => CGI::unescape(params[:from]),
      :to => CGI::unescape(params[:to]),
      :subject => CGI::unescape(params[:subject]),
      #:body => params[:body],
      :body => markdown.render(params[:body]),
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
