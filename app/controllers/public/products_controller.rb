class Public::ProductsController < ApplicationController

  def top
  end

  def about
  end

  def index
  end

  def show
  end

  private
  def product_params
    params.require(product).permit(:image_id, :name, :description, :tax_excluded_price, :sale_status)
  end
end
