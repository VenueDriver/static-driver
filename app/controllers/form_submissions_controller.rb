class FormSubmissionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: :create

  def create
    @form_submission = FormSubmission.new post_data:request.params.inspect
    @form_submission.request = request
    @form_submission.save
    render text:'Thanks!'
  end

end
