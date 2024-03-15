class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: %i[show edit update destroy]

  # GET /companies or /companies.json
  def index
    if params[:search]
      @companies = Company.where("name LIKE ?", "%#{params[:search]}%")
    else
      @companies = Company.all
    end
  end

  # GET /companies/1 or /companies/1.json
  def show
    @company = Company.includes(:memberships).find(params[:id])
    @owners = @company.memberships.where(role: 'owner')
    @employees = @company.memberships.where(role: 'employee')
    @clients = @company.memberships.where(role: 'client')
    @client_intake_forms = @company.client_intake_forms
    @employment_application_forms = @company.employment_application_forms.includes(:user)
    @current_user_owns_company = @owners.exists?(user: current_user)
    @upcoming_appointments = @company.appointments.where('appointment_time > ?', Time.now).order(appointment_time: :asc)
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit; end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        # Create membership for the current user with role 'owner'
        membership = @company.memberships.build(user: current_user, role: 'owner')
        membership.save

        format.html { redirect_to company_url(@company), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name, :phone_number, :address, :city, :country)
  end
end
