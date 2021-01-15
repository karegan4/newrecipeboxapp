class CategoriesController < ApplicationController
    def index
        @categories = Category.all
        @user = session[:user_id]
    end

    def show
        @category = Category.find(params[:id])
        @user = session[:user_id]
    end

    def new
        @category = Category.new
        @user = session[:user_id]
    end

    def create
        @user = session[:user_id]
        @category = Category.new(category_params)
        if @category.valid?
            @category.user_id = session[:user_id]
            @category.save
            redirect_to category_path(@category)
        else
            render 'new'
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    def destroy
        Category.find(params[:id]).destroy
        redirect_to categories_path(@category)
    end

    def most_popular
        @categories = Category.all
        @category = @categories.max_by { |category| category.recipes.length }
        @user = session[:user_id]
    end

    private

    def category_params
        params.require(:category).permit(:user_id, :recipe_id, :category_name)
    end
end