class LocalesController < ApplicationController
  before_action :set_locale, only: %i[ show update destroy ]

  # GET /locales
  def index
    @locales = Locale.all

    render json: @locales
  end

  # GET /locales/1
  def show
    render json: @locale
  end

  # POST /locales
  def create
    @locale = Locale.new(locale_params)

    if @locale.save
      render json: @locale, status: :created, location: @locale
    else
      render json: @locale.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locales/1
  def update
    if @locale.update(locale_params)
      render json: @locale
    else
      render json: @locale.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locales/1
  def destroy
    @locale.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_locale
      @locale = Locale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def locale_params
      params.require(:locale).permit(:code, :description)
    end
end
