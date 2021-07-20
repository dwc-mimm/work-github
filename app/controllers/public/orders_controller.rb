class Public::OrdersController < ApplicationController
    
 def new
  @order = Order.new
  @customer = current_customer
 end
 
 def confirm

 end
 
 def complete
 end
 
 def create
  @order = Order.new
  @order.save
  redirect_to confirm_path
 end
 
 def index
  @orders = current_customer.orders
 end
 
 def show
 end
 
 def order_params
  params.require(:order).permit(:postage, :payment, :payment_method, :name, :postcode, :address, :order_status)
 end
 
end
