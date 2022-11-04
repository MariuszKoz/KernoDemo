# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :roles_users, dependent: :destroy
  has_many :users, through: :roles_users

  enum name: { admin: 'admin',
               super_admin: 'super_admin',
               seller: 'seller',
               supervisor: 'supervisor'}

end
