class Admin::OrdersController < Admin::ApplicationController
  def index
    @orders = current_user.orders.paginate(page: params[:page])
  end

  def new
    @order = current_user.orders.new
  end

  def create
    @client = Client.find_or_create_by(client_params)
    @order = current_user.orders.create(order_params.merge({client_id: @client.id}))
    if @order.save
      redirect_to admin_orders_path
    else
      render action: "new"
    end
  end

  def edit
    @order = current_user.orders.find(params[:id])
    @client = @order.client
  end

  def show
    @order = current_user.orders.find(params[:id])
    @client = @order.client
  end

  private
  def order_params
    params.require(:order).permit(:status, :remark)
  end

  def client_params
    params.require(:order).require(:client).permit(:cellphone, :name, :age, :gender, :email, :address, :exam_info)
  end
end
