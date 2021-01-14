class Recipe < ActiveRecord::Base
    belongs_to :category 
    belongs_to :user
    
    has_one_attached :recipe_photo
    validates :recipe_name, presence: true
end