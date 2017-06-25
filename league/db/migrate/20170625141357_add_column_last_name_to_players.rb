class AddColumnLastNameToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :last_name, :string
  end
end
