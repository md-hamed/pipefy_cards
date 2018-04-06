class CreatePhases < ActiveRecord::Migration[5.1]
  def change
    create_table :phases do |t|
      t.integer :pipefy_id
      t.string :name
      t.jsonb :fields
      t.integer :pipe_id

      t.timestamps
    end
    add_index :phases, :pipefy_id
    add_index :phases, :pipe_id
    add_index :phases, [:pipe_id, :pipefy_id]
  end
end
