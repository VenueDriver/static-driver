class FormSubmission < ActiveRecord::Base
  include MailForm::Delivery

  append :remote_ip, :user_agent, :session
  attributes :post_data, :submitter_email, :created_at, :to
  belongs_to :form

  def headers
    {
      :to => @to,
      :subject => "Test email"
    }
  end

  # This is the sender's email, and we won't always have that available.  Some forms might not
  # ask for it.  In those cases, we pass a default.  Because otherwise you'll get this:
  # ArgumentError (An SMTP From address is required to send a message. Set the message
  # smtp_envelope_from, return_path, sender, or from address.)
  def email
    submitter_email || 'webnerds@hakkasan.com'
  end

  after_initialize :use_sendgrid
  def use_sendgrid
    if Rails.env.production?
      # Use Sendgrid for outbound email.
      ActionMailer::Base.smtp_settings = {
        :user_name => Setting.value('sendgrid_username'),
        :password => Setting.value('sendgrid_password'),
        :domain => 'staticdriver.com',
        :address => 'smtp.sendgrid.net',
        :port => 587,
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    end
  end

end
