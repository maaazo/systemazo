class HomeController < ApplicationController
  def index
    @owned_companies = current_user.owned_companies
  end
end
