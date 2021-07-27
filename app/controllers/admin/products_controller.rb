class Admin::ProductsController < ApplicationController
    before_action :authenticate_admin!

    def new
        @product = Product.new
        @genres = Genre.all
    end

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to admin_product_path(@product.id)
    end

    def edit
        @product = Product.find(params[:id])
        @genres = Genre.all
    end

    def update
        @product = Product.find(params[:id])
        @product.update(product_params)
        redirect_to admin_product_path(@product.id)
    end

    private
     def product_params
       params.require(:product).permit(:image, :name, :description, :tax_excluded_price, :sale_status, :genre_id)
     end
end
