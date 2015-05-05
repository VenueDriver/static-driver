class FormSubmissionsController < ApplicationController
  skip_before_filter  :verify_authenticity_token, only: :create

  def create
    @form = Form.find_by(id:params[:form_id])

    # TODO: Fall back on configured defaults if no form is found.

    @form_submission = FormSubmission.new to:@form.to, post_data:request.params.inspect
    @form_submission.request = request
    @form_submission.save

    redirect_to @form.confirmation_url
  end

end
