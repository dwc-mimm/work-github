class Public::DeliveriesController < ApplicationController

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
