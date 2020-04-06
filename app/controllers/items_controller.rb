# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy]
  def index
    @items = Item.all
  end

  def create
    item = item.new(items_params)
    respond_to do |format|
      if item.save
        @items = Item.all
        html_content = render_to_string partial: '/items/partials/items_table', locals: { items: @items }
        format.json { render json: { message: 'item have been successfully created.', messageClass: 'isa_success', html_content: html_content } }
      else
        error = ''
        item.errors.full_messages.each { |e| error += e.to_s + "\n" }
        format.json { render json: { message: error, messageClass: 'isa_error' } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @item.destroy
        @items = Item.all
        html_content = render_to_string partial: '/items/partials/items_table', locals: { items: @items }
        format.json { render json: { message: 'item have been successfully deleted.', messageClass: 'isa_warning', html_content: html_content } }
      else
        error = ''
        @item.errors.full_messages.each { |e| error += e.to_s + "\n" }
        format.json { render json: { message: error, messageClass: 'isa_error' } }
      end
    end
  end

  private

  def items_params
    params.require(:item).permit(:name, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
