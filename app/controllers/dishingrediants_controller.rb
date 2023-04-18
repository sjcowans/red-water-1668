class DishingrediantsController < ApplicationController
  def create
    dishingrediant = DishIngrediant.new(dishingrediant_params)
    dishingrediant.save
    redirect_to "/dishes/#{dishingrediant.dish_id}"
  end

  private
  
  def dishingrediant_params
    params.permit(:id, :dish_id, :ingrediant_id)
  end
end