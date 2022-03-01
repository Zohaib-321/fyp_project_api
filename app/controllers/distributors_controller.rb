class DistributorsController < ApplicationController
  before_action :set_distributor, only: [:show, :update, :destroy]

  # GET /distributors
  def index
    @distributors = Distributor.all

    render json: @distributors
  end

  # GET /distributors/1
  def show
    @distributors = Distributor.find(params[:id])
    render json: @distributor
  end

  # POST /distributors
  def create
    @distributor = Distributor.new(distributor_params)

    if @distributor.save
      render json: @distributor, status: :created, location: @distributor
    else
      render json: @distributor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /distributors/1
  def update
    if @distributor.update(
      name: params[:name],
      license: params[:license],
      number: params[:number]
)
      render json: @distributor
    else
      render json: @distributor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /distributors/1
  def destroy
    @distributor = Distributor.all
    @distributor = Distributor.find(params[:id])
    @distributor.destroy
    render json: @distributor
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distributor
      @distributor = Distributor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def distributor_params
      params.permit(:name, :license, :number)
    end
end
