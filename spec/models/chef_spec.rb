require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  it 'can show unique ingrediants' do
    @chef_1 = Chef.create!(name: "Joe")
    @dish_1 = @chef_1.dishes.create!(name: "yumyum", description: "Delicioso!")
    @dish_2 = @chef_1.dishes.create!(name: "Omnomnom", description: "Delicioso!")
    @ingrediant_1 = Ingrediant.create!(name: "Summathis", calories: 1000)
    @ingrediant_2 = Ingrediant.create!(name: "Summathat", calories: 1000)
    @ingrediant_3 = Ingrediant.create!(name: "Saucy Sauce", calories: 2000)
    @ingrediant_4 = Ingrediant.create!(name: "Lamp", calories: 1000)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_1.id)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_2.id)
    DishIngrediant.create!(dish_id: @dish_2.id, ingrediant_id: @ingrediant_1.id)
    DishIngrediant.create!(dish_id: @dish_2.id, ingrediant_id: @ingrediant_2.id)
    DishIngrediant.create!(dish_id: @dish_2.id, ingrediant_id: @ingrediant_4.id)

    expect(@chef_1.unique_ingrediants).to eq([@ingrediant_1, @ingrediant_2, @ingrediant_4])
  end
end