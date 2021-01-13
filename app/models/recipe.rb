class Recipe < ActiveRecord::Base
    belongs_to :category 
    belongs_to :user
    
    has_one_attached :recipe_photo
end