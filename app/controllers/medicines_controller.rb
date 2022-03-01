class MedicinesController < ApplicationController
  before_action :set_medicine, only: [:show, :update, :destroy]

  # GET /medicines
  def index
    @medicines = Medicine.all

    render json: @medicines
  end

  # GET /medicines/1
  def show
    @medicines = Medicine.find (params[:id])
    render json: @medicine
  end

  # POST /medicines
  def create
    @medicine = Medicine.new(medicine_params)

    if @medicine.save
      render json: @medicine, status: :created, location: @medicine
    else
      render json: @medicine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medicines/1
  def update
    if @medicine.update(
      name: params[:name],
      molecule: params[:molecule],
      price: params[:price],
      batch_no: params[:batch_no],
      exp_date: params[:exp_date],
      manf_date: params[:manf_date],
      manufactors_id: params[:manufactors_id]
    )
      render json: @medicine
    else
      render json: @medicine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medicines/1
  def destroy
    @medicine = Medicine.all
    @medicine = Medicine.find(params[:id])
    @medicine.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicine
      @medicine = Medicine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medicine_params
      params.permit(:name, :molecule, :price, :batch_no, :exp_date, :manf_date, :manufactors_id)
    end
end
