class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :pipefy_id
      t.string :name
      t.jsonb :fields, default: []
      t.integer :phase_id

      t.timestamps
    end
    add_index :cards, :pipefy_id
    add_index :cards, :phase_id
    add_index :cards, [:phase_id, :pipefy_id]
  end
end
