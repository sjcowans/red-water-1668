class DishIngrediant < ApplicationRecord
  belongs_to :dish
  belongs_to :ingrediant
end