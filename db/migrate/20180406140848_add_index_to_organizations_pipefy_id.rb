class AddIndexToOrganizationsPipefyId < ActiveRecord::Migration[5.1]
  def change
    add_index :organizations, :pipefy_id, unique: true
  end
end
