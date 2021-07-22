class Public::ProductsController < ApplicationController

  def top
    @products = Product.all.order(created_at: :desc)
  end

  def about
  end

  def index
    @products = Product.where(sale_status: true).page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(product).permit(:image_id, :name, :description, :tax_excluded_price, :sale_status)
  end
end
