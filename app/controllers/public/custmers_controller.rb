class Public::CustmersController < ApplicationController
    def show
    end
    
    def edit
    end
    
    def update
    end
    
    def quit
    end
    
    def withdraw
    end
    
    private
  def custmers_params
    params.require(:custmers).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
  end
end
