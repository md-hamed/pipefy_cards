class Organization < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :pipefy_id, presence: true, uniqueness: true

  # associations
  has_many :pipes
end
