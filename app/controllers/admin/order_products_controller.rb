class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_product = OrderProduct.find(params[:id])
    @order = @order_product.order
    @order_product.update(order_product_params)
   if @order_product.production_status == "製作中"
     @order.update(order_status: "製作中")
   end
   order_products = OrderProduct.where(order_id: @order_product.order_id)
   finish_item = order_products.where(production_status: "製作完了")
   if  finish_item.count == order_products.count
     @order.update(order_status: "発送準備中")
   end
   redirect_to admin_order_path(@order)
  end


  private
  def order_product_params
    params.require(:order_product).permit(:production_status)
  end


end
