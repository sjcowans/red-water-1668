class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingrediants, through: :dishes

  def unique_ingrediants
    ingrediants.distinct
  end
end