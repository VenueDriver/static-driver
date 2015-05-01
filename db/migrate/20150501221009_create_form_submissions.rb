class CreateFormSubmissions < ActiveRecord::Migration
  def change
    create_table :form_submissions do |t|
      t.text :post_data
      t.string :remote_ip
      t.string :user_agent
      t.string :session
      t.string :submitter_email

      t.timestamps null: false
    end
  end
end
