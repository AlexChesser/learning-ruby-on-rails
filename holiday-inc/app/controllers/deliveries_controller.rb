class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[ show update destroy ]

  # GET /deliveries
  def index
    @deliveries = Delivery.all

    render json: @deliveries
  end

  # GET /deliveries/1
  def show
    render json: @delivery
  end

  # POST /deliveries
  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.assigned_to_id == nil
      user = User.where(
        :country_id => @delivery.destination_id,
        :role_id => 2
      ).first
      @delivery.assigned_to_id = user.id
    end

    if @delivery.save
      render json: @delivery, status: :created, location: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deliveries/1
  def update
    if @delivery.update(delivery_params)
      render json: @delivery
    else
      render json: @delivery.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deliveries/1
  def destroy
    @delivery.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delivery_params
      params.require(:delivery).permit(:manifest, :delivery_date, :customer_id, :assigned_to_id, :destination_id, :is_complete)
    end
end
