class IngrediantsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
  end
end
