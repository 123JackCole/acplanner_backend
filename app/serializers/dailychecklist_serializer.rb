class DailychecklistSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :checked_statuses
end