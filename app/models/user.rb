class User < ActiveRecord::Base
    has_many :recipes
    has_many :categories, through: :recipes
    has_secure_password

    validates :username, presence: true
    validates :email, uniqueness: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.username = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
    end
end