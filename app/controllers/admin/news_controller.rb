class Admin::NewsController < Admin::ApplicationController
  def index
    @news = News.order("id desc").paginate(page: params[:page])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    @news.update(info_params)
    if @news.update(info_params)
      redirect_to admin_infos_path
    else
      render action: "edit"
    end
  end

  private
  def info_params
    params.require(:news).permit(:title, :content, :image)
  end
end
