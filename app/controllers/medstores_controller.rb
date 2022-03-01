class MedstoresController < ApplicationController
  before_action :set_medstore, only: [:show, :update, :destroy]

  # GET /medstores
  def index
    @medstores = Medstore.all

    render json: @medstores
  end

  # GET /medstores/1
  def show
    @medstores = Medstore.find (params[:id])
    render json: @medstore
  end

  # POST /medstores
  def create
    @medstore = Medstore.new(medstore_params)

    if @medstore.save
      render json: @medstore, status: :created, location: @medstore
    else
      render json: @medstore.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medstores/1
  def update
    if @medstore.update(
      name: params[:name],
      license: params[:license],
      address: params[:address],
      number: params[:number]
    )
      render json: @medstore
    else
      render json: @medstore.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medstores/1
  def destroy
    @medstore = Medstore.all
    @medstore = Medstore.find(params[:id])
    @medstore.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medstore
      @medstore = Medstore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medstore_params
      params.permit(:name, :license, :number, :address)
    end
end
