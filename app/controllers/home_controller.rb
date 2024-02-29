class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @owned_companies = current_user.owned_companies
    @appointments = current_user.appointments
  end
end
