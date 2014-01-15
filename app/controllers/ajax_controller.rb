class AjaxController < ApplicationController
  def get_client_by_cellphone
    render json: Client.where(cellphone: params[:cellphone].strip).first
  end

  def set_order_squad
    render json: (Order.find(params[:order_id]).card.update(squad_id: params[:squad_id]) rescue false)
  end

  def set_order_card_sn
    card = Card.where(sn: params[:card_sn]).first
    render json: (card.update(order_id: Order.find(params[:order_id]).id) rescue false)
  end
end
