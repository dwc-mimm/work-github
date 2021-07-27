class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    case params[:order_sort]
    when "0"
      customer_id = Rails.application.routes.recognize_path(request.referer)[:id]
      @customer = Customer.find(customer_id)
      @orders = @customer.orders
    else
      @orders = Order.all
    end
  end

  def show
   @order = Order.find(params[:id])
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_order_path(@order) 
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
