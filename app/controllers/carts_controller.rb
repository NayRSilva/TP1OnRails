class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def add_item
		quantity = params[:quantity]
		if quantity.to_i > 0 
			@product = params[:id]
			current_cart.push(quantity: quantity, product: @product)
		end
		redirect_to root_path
	end

	def delete_item
		@product = params[:id]
		session[:cart].delete_if{| x | x["product"] == @product}
		redirect_to root_path

	end
	
	private

	def current_cart
		session[:cart] ||= []
end
end
