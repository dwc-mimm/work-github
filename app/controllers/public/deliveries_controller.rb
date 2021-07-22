class Public::DeliveriesController < ApplicationController
 #before_action :authenticate_customer!
 #ログイン機能実装後
 
def index
end

def create
end

def edit
end

def update
end

def destroy
end



private
def delivery_params
  params.require(:deliveries).permit(:postcode, :name, :address)
end

end
