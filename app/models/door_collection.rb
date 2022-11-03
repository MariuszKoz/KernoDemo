class DoorCollection < ApplicationRecord
  has_many  :door_models
  belongs_to  :door_group

end
