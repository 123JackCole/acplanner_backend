class FishSerializer < ActiveModel::Serializer
    attributes :id, :collectable_id, :name, :image, :scientific_name, :family, :time_year, :time_day, :location, :size, :rarity, :price, :shadow
end  