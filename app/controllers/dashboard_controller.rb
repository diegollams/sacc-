class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # separeta for admin all customers and for salesman own customers
    @customers = current_user.customers
    @quotations = current_user.quotations
    @appointments = current_user.appointments
    @interactions = current_user.interactions
  end
end
