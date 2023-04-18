require 'rails_helper'

RSpec.describe 'chefs show', type: :feature do
  before(:each) do
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

    visit "/chefs/#{@chef_1.id}"
  end

  it 'has link for chefs items' do 
    expect(page).to have_link("Chefs Ingrediants")
  end

  it 'goes to chefs items index page with unique items' do
    click_on 'Chefs Ingrediants'
    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingrediants")
    expect(page).to have_content(@ingrediant_1.name, count: 1)
    expect(page).to have_content(@ingrediant_2.name, count: 1)
    expect(page).to have_content(@ingrediant_4.name, count: 1)
    expect(page).to have_no_content(@ingrediant_3.name)
  end
end