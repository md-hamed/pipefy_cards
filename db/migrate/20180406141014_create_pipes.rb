class CreatePipes < ActiveRecord::Migration[5.1]
  def change
    create_table :pipes do |t|
      t.integer :pipefy_id
      t.string :name
      t.jsonb :start_form_fields, default: []
      t.integer :organization_id

      t.timestamps
    end
    add_index :pipes, :pipefy_id
    add_index :pipes, :organization_id
    add_index :pipes, [:organization_id, :pipefy_id]
  end
end
