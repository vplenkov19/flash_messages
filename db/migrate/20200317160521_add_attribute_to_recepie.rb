class AddAttributeToRecepie < ActiveRecord::Migration[5.2]
  def change
    add_column :recepies, :name, :string, required: true
    add_column :recepies, :description, :string, required: true
  end
end
