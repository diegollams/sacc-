class InteractionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_interaction, only: [:show, :edit, :update, :destroy]
  before_action :set_customer,only: [:index,:new]
  # GET /interactions
  # GET /interactions.json
  def index
    @interactions = Interaction.from_customer @customer
  end

  # GET /interactions/1
  # GET /interactions/1.json
  def show
  end

  # GET /interactions/new
  def new
    @interaction = Interaction.new
  end

  # GET /interactions/1/edit
  def edit
    @customer = @interaction.customer
  end

  # POST /interactions
  # POST /interactions.json
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

  # PATCH/PUT /interactions/1
  # PATCH/PUT /interactions/1.json
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

  # DELETE /interactions/1
  # DELETE /interactions/1.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_interaction
      @interaction = Interaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interaction_params
      params.require(:interaction).permit(:kind, :observation, :date, :time, :customer_id)
    end
end
