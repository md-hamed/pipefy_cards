class Pipe < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :pipefy_id, presence: true, uniqueness: true

  # associations
  belongs_to :organization
  has_many :phases, dependent: :destroy
end
