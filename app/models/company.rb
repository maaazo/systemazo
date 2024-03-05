class Company < ApplicationRecord
  has_many :appointments
  has_many :client_intake_forms
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
end
