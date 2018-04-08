class Card < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :pipefy_id, presence: true, uniqueness: true
  
  # associations
  belongs_to :phase

  alias_attribute :name, :title
end
