# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy]
  def index
    @items = Item.all
  end

  def create
    item = Item.new(items_params)
    respond_to do |format|
      message = ''
      messageClass = ''
      html_content = nil
      if item.save
        items = Item.all
        message = 'Item have been successfully created.'
        messageClass = 'isa_success'
        html_content = render_to_string partial: '/items/partials/items_table', locals: { items: items }
      else
        messageClass = 'isa_error'
        recipe.errors.full_messages.each { |e| message += e.to_s + "\n" }
      end
      format.json { render json: { message: message, messageClass: messageClass, html_content: html_content } }
    end
  end

  def destroy
    respond_to do |format|
      message = ''
      messageClass = ''
      html_content = nil
      if @item.destroy
        items = Item.all
        message = 'Item have been successfully deleted.'
        messageClass = 'isa_warning'
        html_content = render_to_string partial: '/items/partials/items_table', locals: { items: items }
      else
        messageClass = 'isa_error'
        recipe.errors.full_messages.each { |e| message += e.to_s + "\n" }
      end
      format.json { render json: { message: message, messageClass: messageClass, html_content: html_content } }
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
