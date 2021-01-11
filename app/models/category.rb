class Category < ActiveRecord::Base
    has_many :recipes
    has_many :users, through: :recipes

end