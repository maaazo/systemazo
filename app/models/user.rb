class User < ApplicationRecord
  has_many :memberships
  has_many :companies, through: :memberships
  has_many :client_intake_forms
  has_many :employment_application_forms

  has_many :appointments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def owned_companies
    companies.where(memberships: { role: 'owner' })
  end

  def self.create_with_params(sign_up_params)
    new_user = new(
      first_name: sign_up_params[:first_name],
      last_name: sign_up_params[:last_name],
      date_of_birth: sign_up_params[:date_of_birth],
      phone_number: sign_up_params[:phone_number],
      address: sign_up_params[:address],
      city: sign_up_params[:city],
      country: sign_up_params[:country],
      email: sign_up_params[:email],
      password: sign_up_params[:password],
      password_confirmation: sign_up_params[:password_confirmation]
    )
    new_user.save
    new_user
  end
end
