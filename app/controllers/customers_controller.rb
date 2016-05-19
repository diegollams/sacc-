class CustomersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.search params[:search]
    respond_to do |format|
      format.html
      format.js
      format.json {render :index}
    end
  end

  def show
  end

  def new
    @customer = Customer.new
    @salesman = current_user if current_user.salesman?
  end

  def edit
    @customer = Customer.find(params[:id])
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
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors.full_messages, status: :unprocessable_entity }
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
      params.require(:customer).permit(:salesman_id, :first_name, :middle_name, :last_name, :marital_status, :email, :gender, :spouse, :zipcode, :main_phone, :secondary_phone)
    end
end
