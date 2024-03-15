class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: %i[show edit update destroy]

  def index
    if params[:company_id]
      @company = Company.find(params[:company_id])
      @upcoming_appointments = @company.appointments.where('appointment_time >= ?', Time.now)
      @past_appointments = @company.appointments.where('appointment_time < ?', Time.now)
    else
      @upcoming_appointments = current_user.appointments.where('appointment_time >= ?', Time.now)
      @past_appointments = current_user.appointments.where('appointment_time < ?', Time.now)
    end
  end

  def new
    @appointment = Appointment.new(company_id: params[:company_id], user_id: current_user.id)
    @duration_options = duration_options
    @companies = Company.all
    @users = User.all
  end

  def show; end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    begin
      if @appointment.save
        redirect_to @appointment, notice: 'Appointment was successfully created.'
      else
        @error_message = @appointment.errors.full_messages.first
        redirect_to new_appointment_path, alert: @error_message
      end
    rescue ActionController::ParameterMissing => e
      flash.now[:alert] = "Missing parameter: #{e.param}"
      render :new
    rescue ActionController::UnpermittedParameters => e
      flash.now[:alert] = "Unpermitted parameter: #{e.params}"
      render :new
    end
  end

  def edit
    @duration_options = duration_options
  end

  def update
    if @appointment.update(appointment_params)
      notice_msg = 'Appointment was successfully updated.'
    else
      @duration_options = duration_options
      notice_msg = @appointment.errors.full_messages.join('. ')
    end
    redirect_to @appointment, notice: notice_msg
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment was successfully deleted.'
  end

  private

  def set_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:company_id, :user_id, :appointment_time, :duration)
  end

  def duration_options
    (15..420).step(15).map { |minutes| [format_duration(minutes), minutes] }
  end

  def format_duration(minutes)
    hours = minutes / 60
    minutes_left = minutes % 60
    "#{hours} hours #{minutes_left} minutes"
  end
end
