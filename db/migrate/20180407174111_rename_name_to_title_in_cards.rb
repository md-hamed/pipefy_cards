class RenameNameToTitleInCards < ActiveRecord::Migration[5.1]
  def change
    rename_column :cards, :name, :title
  end
end
