class Admin::OrdersController < Admin::ApplicationController
  def index
    if current_user.admin?
      @orders = condition_orders.order("id desc").paginate(page: params[:page])
    else
      @orders = current_user.orders.order("id desc").paginate(page: params[:page])
    end
  end

  def new
    @order = current_user.orders.new
    @squads = Squad.select("id, name")
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
    @squads = Squad.select("id, name")
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

  # 根据查询条件的order结果集
  def condition_orders
    orders = Order
    orders = orders.where(params.slice(:user_id)) if params[:user_id].present?
    orders = orders.where(is_paid: (params[:is_paid] == "是" ? true : false)) if params[:is_paid].present?
    orders = orders.where(is_paid: (params[:is_performed] == "是" ? true : false)) if params[:is_performed].present?
    orders = orders.where("created_at > ?", params[:order_from]) if params[:order_from].present?
    orders = orders.where("created_at < ?", params[:order_to]) if params[:order_to].present?
    orders
  end
end
