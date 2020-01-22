class RenameTypeColumnToStyleInOrigamiModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :origamis, :type, :style
  end
end
