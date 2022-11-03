class Store < ApplicationRecord
  has_many  :users
  has_many  :clients
  has_many  :offers, through: :users
end