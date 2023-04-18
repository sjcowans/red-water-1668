class Ingrediant < ApplicationRecord
  has_many :dish_ingrediants
  has_many :dishes, through: :dish_ingrediants

  def self.calorie_count
    sum('calories')
  end
end