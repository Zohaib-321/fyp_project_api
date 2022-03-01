class ManufactorsController < ApplicationController
  before_action :set_manufactor, only: [:show, :update, :destroy]

  # GET /manufactors
  def index
    @manufactors = Manufactor.all

    render json: @manufactors
  end

  # GET /manufactors/1
  def show
    @manufactor = Manufactor.find(params[:id])
    render json: @manufactor
  end

  # POST /manufactors
  def create
    @manufactor = Manufactor.new(manufactor_params)

    if @manufactor.save
      render json: @manufactor, status: :created, location: @manufactor
    else
      render json: @manufactor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /manufactors/1
  def update
    if @manufactor.update(
      name: params[:name],
      license: params[:license],
      address: params[:address],
      number: params[:number]
    )
      render json: @manufactor
    else
      render json: @manufactor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /manufactors/1
  def destroy
    @manufactor = Manufactor.all
    @manufactor = Manufactor.find(params[:id])
    @manufactor.destroy
    render json: @manufactor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufactor
      @manufactor = Manufactor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manufactor_params
      params.permit(:name, :license, :address, :number, :distributor_id)
    end
end
