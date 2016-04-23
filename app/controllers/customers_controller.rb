class CustomersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
    @genders = Customer.genders
    @marital_statuses = Customer.marital_statuses
  end

  def edit
    @customer = Customer.find(params[:id])
    @genders = Customer.genders
    @marital_statuses = Customer.marital_statuses
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.salesman = current_user unless current_user.admin?
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @genders = Customer.genders
      @marital_statuses = Customer.marital_statuses
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:register_date, :first_name, :middle_name, :last_name, :marital_status, :email, :gender, :spouse, :zipcode)
    end
end
