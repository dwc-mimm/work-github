class Public::CustomersController < ApplicationController

    def show
       @customer = Customer.find(params[:id])
    end
    
    def edit
      @customer = Customer.find(params[:id])
    end
    
    def update
       @customer = Customer.find(params[:id])
       @customer.update(customer_params)
       redirect_to customer_path(@customer.id)
    end
    
    def quit
    end
    
    def withdraw
        @customer = Customer.find_by(name: params[:name])
        @customer.update(is_valid: false)
        reset_session
        redirect_to root_path
    end
    
    def reject_inactive_user
    @customer = Customer.find_by(name: params[:customer][:name])
    if @customer
      if @customer.valid_password?(params[:user][:password]) && !@customer.is_valid
        redirect_to new_customer_session_path
      end
    end
    end
    
    private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_deleted)
  end
end
