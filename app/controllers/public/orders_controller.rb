class Public::OrdersController < ApplicationController
    
 def new
 end
 
 def confirm
 end
 
 def complete
 end
 
 def create
 end
 
 def index
 end
 
 def show
 end
 
 def order_params
  params.require(:order).permit(:postage, :payment, :payment_method, :name, :postcode, :address, :order_status)
 end
 
end
