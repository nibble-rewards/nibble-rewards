class Reminder < ApplicationMailer
  default from: 'reminder@sirspamsalot.com'
  def reminder_email(email_hash)
    @body = email_hash[:body]
    mail(email_hash) #required_keys => [:to, :subject] ... optional bcc & cc which can be arrays
  end
end
