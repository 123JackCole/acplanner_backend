class FossilSerializer < ActiveModel::Serializer
    attributes :id, :collectable_id, :name, :image, :scientific_name, :sections, :period, :length, :price
end