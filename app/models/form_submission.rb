class FormSubmission < ActiveRecord::Base
  include MailForm::Delivery

  append :remote_ip, :user_agent, :session
  attributes :post_data, :submitter_email, :created_at

  def headers
    {
      :to => "ryan@hakkasan.com, dnorrbom@hakkasan.com",
      :subject => "Test email"
    }
  end

  # This is the sender's email, and we won't always have that available.  Some forms might not
  # ask for it.  In those cases, we pass nil and the mail_form gem simply omits the From: line.
  def email
    submitter_email || nil
  end
end
