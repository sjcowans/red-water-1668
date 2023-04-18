require 'rails_helper'

RSpec.describe 'dishes show', type: :feature do
  before(:each) do
    @chef_1 = Chef.create!(name: "Joe")
    @dish_1 = @chef_1.dishes.create!(name: "yumyum", description: "Delicioso!")
    @ingrediant_1 = Ingrediant.create!(name: "Summathis", calories: 1000)
    @ingrediant_2 = Ingrediant.create!(name: "Summathat", calories: 1000)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_1.id)
    DishIngrediant.create!(dish_id: @dish_1.id, ingrediant_id: @ingrediant_2.id)

    visit "/dishes/#{@dish_1.id}"
  end

  it "has dish's name and description" do
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
  end

  it 'has list of ingrediants for dish' do
    expect(page).to have_content(@ingrediant_1.name)
    expect(page).to have_content(@ingrediant_2.name)
  end

  it 'has calorie count' do
    expect(page).to have_content(2000)
  end

  it 'has chefs name' do
    save_and_open_page
    expect(page).to have_content(@chef_1.name)
  end
end