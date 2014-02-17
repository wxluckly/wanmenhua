class InfoController < ApplicationController
  def show
    @info = Info.find(params[:id])
  end
end
