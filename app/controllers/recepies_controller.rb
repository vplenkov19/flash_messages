class RecepiesController < ApplicationController
  before_action :set_recepie, only: [:destroy]
  def index
    @recepies = Recepie.all
  end

  def create
    recepie = Recepie.new(recepies_params)
    respond_to do |format|
      if recepie.save
        format.json { json: { message: 'Recepie have been successfully created.', messageClass: 'isa_success'}  }
      else
        error = ""
        recepie.errors.full_messages.each { |e| error += e.to_s + "\n" }
        format.json { render json: {message: error , messageClass: "isa_error"} }
      end
    end
  end

  def destroy
    if @recepie.destroy
      format.json { json: { message: 'Recepie have been successfully deleted.', messageClass: 'isa_warning'}  }
    else
      error = ""
      @recepie.errors.full_messages.each { |e| error += e.to_s + "\n" }
      format.json { render json: {message: error , messageClass: "isa_error"} }
    end
  end


  private

  def recepies_params
    params.require(:recepie).permit(:name, :description)
  end

  def set_recepie
    @recepie = Recepie.find(params[:id])
  end
end
