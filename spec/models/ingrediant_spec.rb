require 'rails_helper'


RSpec.describe Ingrediant, type: :model do
  it 'can add calories' do
    @chef_1 = Chef.create!(name: "Joe")
    @dish_1 = @chef_1.dishes.create!(name: "yumyum", description: "Delicioso!")
    @dish_2 = @chef_1.dishes.create!(name: "Omnomnom", description: "Delicioso!")
    @ingrediant_1 = Ingrediant.create!(name: "Summathis", calories: 1000)
    @ingrediant_2 = Ingrediant.create!(name: "Summathat", calories: 1000)
    @ingrediant_3 = Ingrediant.create!(name: "Saucy Sauce", calories: 2000)
    @ingrediant_4 = Ingrediant.create!(name: "Lamp", calories: 1000)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_1.id)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_2.id)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_1.id)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_2.id)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_4.id)

    expect(@dish_1.ingrediants.calorie_count).to eq(5000)
  end
end