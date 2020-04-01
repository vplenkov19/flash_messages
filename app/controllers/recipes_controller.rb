# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:destroy]
  def index
    @recipes = Recipe.all
  end

  def create
    recipe = Recipe.new(recipes_params)
    respond_to do |format|
      if recipe.save
        @recipes = Recipe.all
        html_content = render_to_string partial: '/recipes/partials/recipes_table', locals: { recipes: @recipes }
        format.json { render json: { message: 'Recipe have been successfully created.', messageClass: 'isa_success', html_content: html_content } }
      else
        error = ''
        recipe.errors.full_messages.each { |e| error += e.to_s + "\n" }
        format.json { render json: { message: error, messageClass: 'isa_error' } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @recipe.destroy
        @recipes = Recipe.all
        html_content = render_to_string partial: '/recipes/partials/recipes_table', locals: { recipes: @recipes }
        format.json { render json: { message: 'Recipe have been successfully deleted.', messageClass: 'isa_warning', html_content: html_content } }
      else
        error = ''
        @recipe.errors.full_messages.each { |e| error += e.to_s + "\n" }
        format.json { render json: { message: error, messageClass: 'isa_error' } }
      end
    end
  end

  private

  def recipes_params
    params.require(:recipe).permit(:name, :description)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
