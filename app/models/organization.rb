class Organization < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :pipefy_id, presence: true, uniqueness: true
end
