class ListsController < ApplicationController
  #index action
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

end
