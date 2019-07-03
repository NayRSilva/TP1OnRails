class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
 before_action :verify_user, only: [:index]
  
  # GET /orders
  # GET /orders.json
  
  def verify_user

    if (user_signed_in? == false)
      redirect_to root_path, alert: "voce deve estar logado"
    elsif (current_user.admin == false)
      redirect_to root_path, alert: "voce não possui permissão"
    end
 

  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.product = Product.find(order_params[:product])
    @order.user = current_user

    @order.save
   
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @total=0
    session[:cart].each do |item|
      product = Product.find(item["product"])
      quant = item["quantity"]

      @total += quant.to_i * meal.price
    end
	  @order = Order.new(user_id: current_user.id, price: @soma, situation_id: 1)
    @order.save!

    session[:cart].each do |item|
      Product = Product.find(item["product"])
      quant = item["quantity"]
    
    end
    session[:cart] = nil  
    redirect_to root_path
end
  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:subtotal, :total, :rent_day, :return_day, :user_id, :product_id)
    end
end
