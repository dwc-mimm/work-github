class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!

 def new
  @order = Order.new
  @deliveries = Delivery.all
 end

 def confirm
  @carts = Cart.where(customer_id: current_customer)
  @order = Order.new
  @order.payment_method = params[:order][:payment_method].to_i

  if params[:order][:addresses] == "address"#登録住所（デフォルト）
  @order.postcode = current_customer.postcode
  @order.address = current_customer.address
  @order.name = current_customer.last_name + current_customer.first_name

  elsif params[:order][:addresses] == "registration_adderss"#登録済み住所
  @oreder.postcode = Delivery.find(params[:order][:address_id]).postcode
  @oreder.address =  Delivery.find(params[:order][:address_id]).address
  @oreder.name =  Delivery.find(params[:order][:address_id]).name

  elsif params[:order][:addreses] == "new_address"#新規住所登録
   @order.postcode = params[:order][:postcode]
   @order.address = params[:order][:address]
   @oreder.name = params[:order][:name]

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
  @carts = Cart.where(customer_id: current_customer)
 end

 def order_params
  params.require(:order).permit(:postage, :payment, :payment_method, :name, :postcode, :address, :total_price, :order_status)
 end

 def address_params
  params.require(:order).permit(:postcode, :address, :name)
 end


end
