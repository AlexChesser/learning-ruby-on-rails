# require "./app/models/serializers/user/user_assigned_deliveries.rb"
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show show_deliveries update destroy ]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  #GET /users/1/deliveries
  def show_deliveries
    render json: @user, include: [
      :assigned => { :include => [ :destination, :customer ] },
      :shipped => { :include => [ :destination, :assigned_to ] }
    ]
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:login, :name, :email, :country_id, :role_id, :locale_id)
    end
end
