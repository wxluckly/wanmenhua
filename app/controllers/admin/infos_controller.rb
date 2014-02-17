class Admin::InfosController < Admin::ApplicationController
  def index
    @infos = Info.order("id desc").paginate(page: params[:page])
  end

  def edit
    @info = Info.find(params[:id])
  end

  def update
    @info = Info.find(params[:id])
    @info.update(info_params)
    if @info.update(info_params)
      redirect_to admin_infos_path
    else
      render action: "edit"
    end
  end

  private
  def info_params
    params.require(:info).permit(:title, :content, :image)
  end
end
