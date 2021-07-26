class Admin::OrderProductsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
  end
  
  private
  def order_product_params
    params.require(:order_products).permit(:production_status)
  end
  

end
