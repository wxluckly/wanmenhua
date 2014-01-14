class Admin::OrdersController < Admin::ApplicationController
  def index
    if current_user.admin?
      @orders = Order.order("id desc").paginate(page: params[:page])
    else
      @orders = current_user.orders.order("id desc").paginate(page: params[:page])
    end
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
    @order = current_user.admin? ? Order.find(params[:id]) : current_user.orders.find(params[:id])
    @client = @order.client
  end

  def update
    @order = current_user.admin? ? Order.find(params[:id]) : current_user.orders.find(params[:id])
    @client = @order.client
    if @client.update(client_params) and @order.update(order_params)
      redirect_to admin_orders_path
    else
      render action: "edit"
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    @client = @order.client
  end

  private
  def order_params
    params.require(:order).permit(:status, :remark, :is_paid, :is_performed)
  end

  def client_params
    params.require(:order).require(:client).permit(:cellphone, :name, :age, :gender, :email, :address, :exam_info)
  end
end
