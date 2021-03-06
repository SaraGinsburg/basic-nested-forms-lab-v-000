require 'pry'
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'tasty')
    @recipe.ingredients.build(name: 'delicious')
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
      :name,
      :quantity
      ]
    )
  end
end
