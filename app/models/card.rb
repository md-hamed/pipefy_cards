class Card < ApplicationRecord
  # validations
  validates :title, presence: true
  validates :pipefy_id, presence: true, uniqueness: true
  
  # associations
  belongs_to :phase
end
