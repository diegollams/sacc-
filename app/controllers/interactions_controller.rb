class InteractionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]
  before_action :set_customer,only: [:new]

  def index
    @interactions = Interaction.all
    @most_proactive = User.most_proactive
  end

  def show
    @customer = @interaction.customer
    @observation_list = @interaction.observation_list
  end

  def new
    @interaction = Interaction.new
  end

  def edit
    @customer = @interaction.customer
  end

  def create
    @interaction = Interaction.new(interaction_params)
    @customer = @interaction.customer
    respond_to do |format|
      if @interaction.save
        format.html { redirect_to @interaction, notice: 'Interaction was successfully created.' }
        format.json { render :show, status: :created, location: @interaction }
      else
        format.html { render :new }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      @customer = @interaction.customer
      if @interaction.update(interaction_params)
        format.html { redirect_to @interaction, notice: 'Interaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @interaction }
      else
        format.html { render :edit }
        format.json { render json: @interaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @interaction.destroy
    respond_to do |format|
      format.html { redirect_to interactions_url(customer_id: @interaction.customer_id), notice: 'Interaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_customer
      @customer = Customer.find params[:customer_id]
    end

    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    def interaction_params
      params.require(:interaction).permit(:kind, :observation, :date, :time, :customer_id)
    end
end
