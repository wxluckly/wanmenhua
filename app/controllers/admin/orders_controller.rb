class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = current_user.orders.paginate(page: params[:page])
  end

  def new
    @order = current_user.orders.new
  end

  def create
    @order = current_user.orders.create(order_params)
    @client = Client.find_or_initialize_by(client_params)
    @client.orders << @order
    @client.save
    redirect_to admin_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:status, :remark)
  end

  def client_params
    params.require(:order).require(:client).permit(:cellphone, :name, :age, :gender, :email, :address, :exam_info)
  end
end
