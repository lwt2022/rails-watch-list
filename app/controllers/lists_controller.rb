class ListsController < ApplicationController
  #index action
  def index
    @lists = List.all
  end
end

