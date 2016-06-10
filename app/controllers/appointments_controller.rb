class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :cancel, :done, :renew, :destroy]
  before_action :set_customer, only: [:index]

  # GET /appointments
  # GET /appointments.json
  def index
    @date = params[:date].nil? ? Date.today : params[:date].to_date
    if !@customer.nil?
      @appointments = @customer.appointments
      @date_appointments = @customer.appointments_of @date
    else
      @appointments = current_user.appointments
      @date_appointments = current_user.appointments_of @date
    end

    respond_to do |format|
      format.html
      format.js
      format.json
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new(customer_id: params[:customer_id])
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1/cancel
  # PATCH/PUT /appointments/1/cancel.json
  def cancel
    @appointment.canceled!
    respond_to do |format|
      format.js { render :action => "action" }
      format.json
    end
  end

  # PATCH/PUT /appointments/1/done
  # PATCH/PUT /appointments/1/done.json
  def done
    @appointment.done!
    respond_to do |format|
      format.js { render :action => "action" }
      format.json
    end
  end

  # PATCH/PUT /appointments/1/renew
  # PATCH/PUT /appointments/1/renew.json
  def renew
    @appointment.upcoming!
    respond_to do |format|
      format.js { render :action => "action" }
      format.json
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id]) unless params[:customer_id].nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :time, :place, :customer_id)
    end
end
