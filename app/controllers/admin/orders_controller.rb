class Admin::OrdersController < ApplicationController
  
  def index
  end

  def show
  end

  def updated
  end

  private
  def order_params
    params.require(:orders).permit(:order_status)
  end
end
