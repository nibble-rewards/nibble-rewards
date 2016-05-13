

ActionMailer::Base.smtp_settings = {
  :address              => ENV["SMTP_SERVER"],
  :port                 => ENV["SMTP_PORT"],
  :user_name            => ENV["EMAIL_USER"],
  :password             => ENV["EMAIL_PASSWORD"],
  :domain               => ENV["SMTP_DOMAIN"],
  :authentication       => :login,
}

ActionMailer::Base.default_url_options[:host] = ENV["HOST_DOMAIN"] 
