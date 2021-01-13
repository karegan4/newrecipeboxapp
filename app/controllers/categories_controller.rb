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
        @category = Category.new(category_params)
        if @category.valid?
            @category.user_id = session[:user_id]
            @category.save
        end
        if @category.save
            redirect_to category_path(@category)
        else
            redirect_to invalidcategory_path
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

    end

    def invalidcategory
    end

    private

    def category_params
        params.require(:category).permit(:user_id, :recipe_id, :category_name)
    end
end