class ChangeNameOfRecipe < ActiveRecord::Migration[5.2]
  def change
    rename_table :recipes, :items
  end
end
