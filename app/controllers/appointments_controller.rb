class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :validate_appointment_user, only: [:edit, :update, :destroy]


  def index
    @appointments = Appointment.includes(:user).all
  end

  def new
    @appointment = Appointment.new
  end

  def show
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:first_name, :last_name, :address, :phone_number)
    end

  def validate_appointment_user
    unless @appointment.user == current_user
      flash[:notice] = 'the post not belongs to you'
      redirect_to appointment_path
    end
  end


  end
