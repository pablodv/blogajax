class Notifier < ActionMailer::Base

  def password_reset_instructions(user)
     subject       "Password Reset Instructions"
     from          "Blog <noreply@holidayreminder.com>"
     recipients    user.email
     sent_on       Time.now
     body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end

  def activation_instructions(user)
    subject       "Activation Instructions"
    from          "Blog <noreply@holidayreminder.com>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => register_url(user.perishable_token)
  end

  def activation_confirmation(user)
    subject       "Activation Complete"
    from          "Blog <noreply@holidayreminder.com>"
    recipients    user.email
    sent_on       Time.now
    body          :root_url => login_url
  end

  def holiday_reminder(client, holiday)
    subject       "Holiday Reminder"
    from          "Holiday Reminder <noreply@holidayreminder.com>"
    recipients    client.email
    sent_on       Time.now
    body          :holiday_reminder_url => holiday, :exception_mailer =>
                                            edit_exception_url(client.id)
  end

end
