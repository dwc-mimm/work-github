class Public::CartsController < ApplicationController

  before_action :authenticate_customer!


  def index
    @carts = Cart.where(customer_id: current_customer)
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.customer_id = current_customer.id
    @cart.save
    redirect_to carts_path
  end

  def update
    @carts = Cart.where(customer_id: current_customer)
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path
    else
      render "index"
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    carts = Cart.where(customer_id: current_customer)
    carts.each do |cart|
      cart.destroy
    end
    redirect_to carts_path
  end


  private
  def cart_params
    params.require(:cart).permit(:product_id, :product_quantity)
  end
end
