class TaskSerializer < ActiveModel::Serializer
  attributes :id, :dailychecklist_id, :name, :num_of_boxes
end
