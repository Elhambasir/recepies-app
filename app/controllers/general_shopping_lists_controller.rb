class GeneralShoppingListsController < ApplicationController
  def index
    # @food_lists = Food.joins(:recipe_foods).where(foods: { user_id: current_user.id }).where('foods.quantity < recipe_foods.quantity')
    #   .select('foods.*, (recipe_foods.quantity -foods.quantity) as difference')
      
    @recipes = current_user.recipes.includes(recipe_foods: :food)
    @all_recipe_foods = @recipes.map(&:recipe_foods).flatten
    @food_lists = @all_recipe_foods.select { |recipe| recipe.quantity > recipe.food.quantity }
    @total_price = total_price_of_missing_food(@food_lists)
  end

  private

  def total_price_of_missing_food(food_list)
    total_price = 0
    food_list.each do |food|
      total_price += food.food.price * food.food.quantity
    end
    total_price
  end
end
