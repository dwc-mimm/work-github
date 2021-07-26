class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
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
