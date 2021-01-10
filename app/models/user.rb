class User < ActiveRecord::Base
    has_many :recipes
    has_many :categories, through: :recipes
    has_secure_password

    validates :username, presence: true
    validates :email, uniqueness: true
end