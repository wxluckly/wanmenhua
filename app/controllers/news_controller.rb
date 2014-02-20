class NewsController < ApplicationController
  def index
    @news = News.page(params[:page]).per_page(5)
  end
end
