class Category < ActiveRecord::Base
    has_many :recipes
    has_many :users, through: :recipes

    validates :category_name, uniqueness: true
    validates :category_name, presence: true

end