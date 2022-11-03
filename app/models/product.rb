class Product < ApplicationRecord
  has_one :door_group
  has_one :door_collection, through: :door_group
  has_one :door_model, through: :door_collection
  has_one :door_type, through: :group
  has_one :door_layout, through: :group
  has_one :opening_type, through: :group
end