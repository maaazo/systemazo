class EmploymentApplicationFormsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employment_application_form, only: %i[show edit update destroy]

  # index
  def index
    @employment_application_forms = EmploymentApplicationForm.includes(:user, :company).where(company_id: current_user.companies)
  end

  # new
  def new
    @employment_application_form = EmploymentApplicationForm.new
    @companies = current_user.companies
    @company_id = params[:company_id]
    @users = User.all
  end

  # create
  def create
    @employment_application_form = EmploymentApplicationForm.new(employment_application_form_params)

    respond_to do |format|
      if @employment_application_form.save
        format.html do
          redirect_to employment_application_form_url(@employment_application_form)
        end
      else
        @error_message = @employment_application_form.errors.full_messages.first
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: { error: @error_message }, status: :unprocessable_entity }
      end
    end
  end

  # show
  def show; end

  # edit
  def edit
    @companies = current_user.companies
    @users = User.all
  end
  
  # update
  def update
    respond_to do |format|
      if @employment_application_form.update(employment_application_form_params)
        format.html do
          redirect_to employment_application_form_url(@employment_application_form),
                      notice: 'Employee information was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @employment_application_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employment_application_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # destroy
  def destroy
    @employment_application_form.destroy
    respond_to do |format|
      format.html { redirect_to employment_application_forms_url, notice: 'Employment application form was successfully deleted.' }
      format.json { head :no_content }
    end
  end
  private

  def set_employment_application_form
    @employment_application_form = EmploymentApplicationForm.find(params[:id])
  end

  def employment_application_form_params
    params.require(:employment_application_form).permit(
      :company_id,
      :user_id,
      :preferred_name,
      :gender,
      :alternate_phone_number,
      :additional_info
    )
  end
end
