class Phase < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :pipefy_id, presence: true, uniqueness: true
  
  # associations
  belongs_to :pipe
end
