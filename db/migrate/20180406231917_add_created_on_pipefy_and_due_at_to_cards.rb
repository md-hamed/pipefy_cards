class AddCreatedOnPipefyAndDueAtToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :created_on_pipefy_at, :datetime
    add_column :cards, :due_at, :datetime
  end
end
