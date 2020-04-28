class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }

    has_one :setting
    has_many :user_collectables
    has_many :collectables, through: :user_collectables
end
