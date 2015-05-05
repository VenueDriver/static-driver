class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.text :to
      t.string :confirmation_url

      t.timestamps null: false
    end
  end
end
