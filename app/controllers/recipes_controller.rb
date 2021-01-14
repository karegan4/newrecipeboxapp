class RecipesController < ApplicationController

    def index
        @recipes = current_user.recipes
        @user = session[:user_id]
    end

    def show
        @recipe = Recipe.find(params[:id])
        @user = session[:user_id]
        
    end

    def new
        @user = session[:user_id]
        if params[:category_id]
            @recipe = Recipe.new(category_id: params[:category_id])
            
        else
            @recipe = Recipe.new
            @recipes = Recipe.all
        end
        
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid?
            @recipe.save
            redirect_to recipe_path(@recipe)
        else
            redirect_to invalidrecipe_path
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:recipe_name, :serving_size, :directions, :ingredients, :category_name, :category_id, :user_id, :recipe_photo)
    end
end