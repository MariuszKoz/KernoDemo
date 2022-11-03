class Order < ApplicationRecord
  has_one   :client
  has_many  :products
  belongs_to  :user
end