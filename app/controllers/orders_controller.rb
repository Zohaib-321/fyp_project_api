class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    @orders = Order.find(params[:id])
    render json: @orders
  end

  # get orders by distirbutor_id

  def getorder
    #@orders = Distributor.joins(:orders [:order_items]).where("distributors_id=?", params[:distributors_id])
    @orders = Distributor.joins("JOIN orders ON orders.distributors_id = distributors.id JOIN order_items ON order_items.orders_id =  orders.id JOIN medicines ON order_items.medicines_id  = medicines.id JOIN medstores on orders.medstores_id = medstores.id WHERE distributors.id = #{params[:distributors_id]}").select('orders.id,medicines.name as medicine,order_items.quantity,medicines.price,orders.created_at,medstores.name as medstore_name,medstores.address')

    render json:  @orders
  end


  # POST /orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(
      items: params[:items],
      price: params[:price],
      status: params[:status],
      quantity: params[:quantity]

    )
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order = Order.all
    @order = Order.find(params[:id])
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.permit(:items, :price, :status, :quantity, :medstores_id, :distributors_id)
    end
end
