class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingrediants
  has_many :ingrediants, through: :dish_ingrediants
end