class GeneralShoppingListsController < ApplicationController
  def index
    @food_lists = Food.joins(:recipe_foods).where(foods: { user_id: 1 }).where('foods.quantity < recipe_foods.quantity')
      .select('foods.*, (recipe_foods.quantity -foods.quantity) as difference')
    @total_price = total_price_of_missing_food(@food_lists)
  end

  private

  def total_price_of_missing_food(food_list)
    total_price = 0
    food_list.each do |food|
      total_price += food.price * food.difference
    end
    total_price
  end
end
