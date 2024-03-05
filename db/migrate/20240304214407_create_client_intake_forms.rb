class CreateClientIntakeForms < ActiveRecord::Migration[7.1]
  def change
    create_table :client_intake_forms do |t|
      t.references :company, foreign_key: true, null: false
      t.references :user, foreign_key: true

      t.string :first_name
      t.string :last_name
      t.string :preferred_name
      t.string :email_address
      t.string :gender
      t.string :phone_number
      t.date :date_of_birth
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :alternate_phone_number
      t.text :additional_info

      t.timestamps
    end
  end
end
