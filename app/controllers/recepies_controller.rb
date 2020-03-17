class RecepiesController < ApplicationController
  def index
    @recepies = Recepie.all
  end

  def create
  end
end
