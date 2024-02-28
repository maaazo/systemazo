# frozen_string_literal: true

class AddAdditionalInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :status, :string
    add_column :users, :verification_status, :string
    add_column :users, :last_login, :datetime
  end
end
