class ClientIntakeFormsController < ApplicationController
  before_action :set_client_intake_form, only: %i[show edit update destroy]

  # GET /client_intake_forms or /client_intake_forms.json
  def index
    @client_intake_forms = ClientIntakeForm.all
  end

  # GET /client_intake_forms/1 or /client_intake_forms/1.json
  def show; end

  # GET /client_intake_forms/new
  def new
    @client_intake_form = ClientIntakeForm.new
    @companies = current_user.companies
    @company_id = params[:company_id]
    @users = User.all
  end

  # GET /client_intake_forms/1/edit
  def edit
    @companies = current_user.companies
    @users = User.all
  end

  # POST /client_intake_forms or /client_intake_forms.json
  def create
    @client_intake_form = ClientIntakeForm.new(client_intake_form_params)

    respond_to do |format|
      if @client_intake_form.save
        format.html do
          redirect_to client_intake_form_url(@client_intake_form),
                      notice: 'Client intake form was successfully created.'
        end
        format.json { render :show, status: :created, location: @client_intake_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client_intake_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_intake_forms/1 or /client_intake_forms/1.json
  def update
    respond_to do |format|
      if @client_intake_form.update(client_intake_form_params)
        format.html do
          redirect_to client_intake_form_url(@client_intake_form),
                      notice: 'Client intake form was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @client_intake_form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_intake_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_intake_forms/1 or /client_intake_forms/1.json
  def destroy
    @client_intake_form.destroy!

    respond_to do |format|
      format.html { redirect_to client_intake_forms_url, notice: 'Client intake form was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def generate_pdf
    @client_intake_form = ClientIntakeForm.find(params[:id])

    pdf = ClientIntakeFormPdf.new(@client_intake_form)
    send_data pdf.render,
              filename: 'client_intake_form.pdf',
              type: 'application/pdf',
              disposition: 'inline'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client_intake_form
    @client_intake_form = ClientIntakeForm.includes(:user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_intake_form_params
    params.require(:client_intake_form).permit(
      :company_id,
      :user_id,
      :first_name,
      :last_name,
      :preferred_name,
      :email_address,
      :gender,
      :phone_number,
      :alternate_phone_number,
      :date_of_birth,
      :address,
      :city,
      :province,
      :country,
      :additional_info
    )
  end
end
