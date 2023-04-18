require 'rails_helper'

RSpec.describe 'dishes show', type: :feature do
  before(:each) do
    @chef_1 = Chef.create!(name: "Joe")
    @dish_1 = @chef_1.dishes.create!(name: "yumyum", description: "Delicioso!")
    @ingrediant_1 = Ingrediant.create!(name: "Summathis", calories: 1000)
    @ingrediant_2 = Ingrediant.create!(name: "Summathat", calories: 1000)
    @ingrediant_3 = Ingrediant.create!(name: "Saucy Sauce", calories: 2000)
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
    expect(page).to have_content(@chef_1.name)
  end

  it 'can add ingrediant to dish' do
    expect(page).to have_content('Add Ingrediant')
    fill_in 'ingrediant_id', with: "#{@ingrediant_3.id}"
    click_on 'Save'
    @dish_1.reload
    expect(page).to have_current_path("/dishes/#{@dish_1.id}")
    expect(page).to have_content(@ingrediant_3.name)
  end
end