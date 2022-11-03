class DoorGroup < ApplicationRecord
  has_many  :door_collections
  has_many  :door_models
  has_many  :door_types
  has_many  :door_layouts
  has_many  :opening_types

end
