class Admin::ProductsController < ApplicationController
    def new
        @product = Product.new
    end
    
    def index
        @products = Product.all
    end
    
    def show
    end
    
    def create
        @product = Product.new(product_params)
        @product.save!
        redirect_to admin_products_path
    end
    
    def edit
    end
    
    def update
    end
    
    private
     def product_params
       params.require(:product).permit(:image, :name, :description, :tax_excluded_price, :sale_status,:genre_id)
     end
end
