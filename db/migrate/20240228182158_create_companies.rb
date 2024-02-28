class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :city
      t.string :country
      t.timestamps
    end
  end
end
