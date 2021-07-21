class Public::CustomersController < ApplicationController

    def show
       @customer = Customer.find(params[:id])
    end
    
    def edit
      @customer = Customer.find(params[:id])
    end
    
    def update
    end
    
    def quit
    end
    
    def withdraw
    end
    
    private
  def customers_params
    params.require(:customers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
  end
end
