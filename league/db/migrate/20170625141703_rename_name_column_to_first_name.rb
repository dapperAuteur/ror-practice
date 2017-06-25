class RenameNameColumnToFirstName < ActiveRecord::Migration[5.1]
  def change
    rename_column :players, :name, :first_name
  end
end
