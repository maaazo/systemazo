class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @owned_companies = current_user.owned_companies
    @appointments = current_user.appointments
    @client_intake_forms = current_user.client_intake_forms.includes(:company)
    @employment_application_forms = current_user.employment_application_forms.includes(:company)
  end
end
