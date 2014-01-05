class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = current_user.orders.new
  end

  def create
    @order = current_user.orders.new(params[:order])
  end

end
