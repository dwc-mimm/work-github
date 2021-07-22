class Public::OrdersController < ApplicationController
 #before_action :authenticate_customer!
 #ログイン機能実装後
    
 def new
  @order = Order.new
  @customer = current_customer
 
 end
 
 def confirm
 @carts = cuurent_cart
 @order = Order.new(
  customer: current_customer,
  payment_method: params[:order][:payment_method]
 )
 if params[:order][:addresses] == "customer_address"#customerの住所が入っている場合(カラム名は無効に合わせて変更)
  @order.postcode = current_customer.postcode
  @order.address = cureent_customer.address
  @order.name = cuurent_customer.last_name, current_customer.first_name
 
 elsif params[:order][:addresses]  ="new-address"#orderで新規住所登録した場合
  @oreder.postcode = params[:order][:postcode]
  @oreder.address = params[:oreder][:address]
  @oreder.name = params[:oreder][:name]
 end
 end
 
 def complete
 end
 
 def create
  @order = current_customer.orders.new(order_params)
  @order.save
  redirect_to complete_path#confirmで注文確定後complete画面へ移動
 end
 
 def index
  @orders = current_customer.orders
 end
 
 def show
  @orders = Order.find(params[:id])
  
 end
 
 def order_params
  params.require(:order).permit(:postage, :payment, :payment_method, :name, :postcode, :address, :total_price, :order_status)
 end
 
 def address_params
  params.require(:order).permit(:postcode, :address, :name)
 end
end
