class AddFormIdToFormSubmission < ActiveRecord::Migration
  def change
    add_column :form_submissions, :form_id, :integer
  end
end
