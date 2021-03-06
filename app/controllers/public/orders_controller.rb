class Public::OrdersController < ApplicationController
 before_action :authenticate_customer!

 def new
  @order = Order.new
  @deliveries = current_customer.deliveries.all
 end

 def confirm
  @carts = Cart.where(customer_id: current_customer)
  @order = Order.new
  @order.payment_method = params[:order][:payment_method].to_i

  if params[:order][:addresses] == "address"#登録住所（デフォルト）
  @order.postcode = current_customer.postcode
  @order.address = current_customer.address
  @order.name = current_customer.last_name + current_customer.first_name

  elsif params[:order][:addresses] == "registration_address"#登録済み住所
  @order.postcode = Delivery.find(params[:order][:address2]).postcode
  @order.address =  Delivery.find(params[:order][:address2]).address
  @order.name =  Delivery.find(params[:order][:address2]).name

  elsif params[:order][:addresses] == "new_address"#新規住所登録
   @order.postcode = params[:order][:postcode]
   @order.address = params[:order][:address]
   @order.name = params[:order][:name]

  end
 end

 def complete
 end

 def create
  @order = current_customer.orders.new(order_params)
  @order.save
  cart_products = current_customer.carts
  cart_products.each do |cart_product|
   order_product = OrderProduct.new
   order_product.product_id = cart_product.product.id
   order_product.order_id = @order.id
   order_product.product_quantity = cart_product.product_quantity
   order_product.tax_included_price = cart_product.product.tax_excluded_price
   order_product.save
  end
  
   if params[:order][:address_method] == "new_address"
   @delivery = current_customer.deliveries.new
   @delivery.postcode = @order.postcode
   @delivery.address = @order.address
   @delivery.name = @order.name
   @delivery.save
   end
   
  cart_products.destroy_all
  #注文後のカート内アイテム全削除
  redirect_to complete_path#confirmで注文確定後complete画面へ移動
 end

 def index
  @orders = current_customer.orders
 end

 def show
  @order = Order.find(params[:id])
  @carts = Cart.where(customer_id: current_customer)
 end

 def order_params
  params.require(:order).permit(:postage, :payment, :payment_method, :name, :postcode, :address, :total_price, :order_status)
 end

 def address_params
  params.require(:order).permit(:postcode, :address, :name)
 end


end
