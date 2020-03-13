class CreateRecepies < ActiveRecord::Migration[5.2]
  def change
    create_table :recepies do |t|

      t.timestamps
    end
  end
end
