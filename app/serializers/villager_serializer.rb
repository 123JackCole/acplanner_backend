class VillagerSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :quote, :gender, :personality, :species, :birthday, :sign, :phrase, :clothes, :picture, :siblings, :goal, :fear, :favclothing, :leastfavclothing, :favcolor
end