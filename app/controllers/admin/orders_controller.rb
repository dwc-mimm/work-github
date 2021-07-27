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
    
  end

  def updated
  end

  private
  def order_params
    params.require(:orders).permit(:order_status)
  end
end
