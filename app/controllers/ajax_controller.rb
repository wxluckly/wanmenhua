class AjaxController < ApplicationController
  def get_client_by_cellphone
    render :json => Client.where(cellphone: params[:cellphone].strip).first
  end
end
