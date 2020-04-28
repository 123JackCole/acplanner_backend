class Collectable < ApplicationRecord
    belongs_to :user_collectables, optional: true
    has_many :bugs
    has_many :fish
    has_many :fossils
end
