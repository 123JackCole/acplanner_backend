class UserCollectable < ApplicationRecord
  belongs_to :user
  belongs_to :collectable
end
