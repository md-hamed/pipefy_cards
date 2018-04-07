class Phase < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :pipefy_id, presence: true, uniqueness: true
  
  # associations
  belongs_to :pipe
  has_many :cards, dependent: :destroy

  def field_names
    self.pipe.start_form_fields.map { |f| f['label'] } + self.fields.map { |f| f['label']  }
  end
end
