# frozen_string_literal: true

class ChangeRecepiesToRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_table :recepies, :recipes
  end
end
