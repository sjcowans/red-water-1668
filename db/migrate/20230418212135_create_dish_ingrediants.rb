class CreateDishIngrediants < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_ingrediants do |t|
      t.references :dish, foreign_key: true
      t.references :ingrediant, foreign_key: true

      t.timestamps
    end
  end
end
