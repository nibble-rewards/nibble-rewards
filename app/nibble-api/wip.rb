


->() {
  email = {
    :from => Faker::Internet.email,
    :to => 'copremesis@yahoo.com',
    :subject => 'this a test',
    :body => "this is a test email I think this works sometimes <marquee> annoying marketing emails </marquee>"
  }
  Reminder.reminder_email(email).deliver_now
}[]
