# frozen_string_literal: true

class RolesUser < ApplicationRecord
  belongs_to :role
  belongs_to :user
end
