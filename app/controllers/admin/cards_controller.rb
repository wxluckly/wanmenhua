class Admin::CardsController < Admin::ApplicationController
  def index
    @cards = Card.order("id desc").paginate(page: params[:page])
  end
end
