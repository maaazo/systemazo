class CreateEmploymentApplicationForms < ActiveRecord::Migration[7.1]
  def change
    create_table :employment_application_forms do |t|
      t.references :company, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.boolean :company_owner
      t.string :preferred_name
      t.string :gender
      t.string :alternate_phone_number
      t.text :additional_info
      t.timestamps
    end
  end
end
