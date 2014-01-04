class Admin::OrderController < Admin::ApplicationController
  def index
    @orders = Order.all

  end

end
