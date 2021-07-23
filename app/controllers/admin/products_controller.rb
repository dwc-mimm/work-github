class Admin::ProductsController < ApplicationController
    def new
    end

    def index
    end

    def show
    end

    def create
    end

    def edit
    end

    def update
    end

    private
     def product_params
       params.require(:product).permit(:image, :name, :description, :tax_excluded_price, :sale_status)
     end
end
