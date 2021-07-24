class Admin::OrderProductsController < ApplicationController

def update
end

private
def order_product_params
  params.require(:order_products).permit(:production_status)
end
  

end
