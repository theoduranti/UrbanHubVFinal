class AddColumnNaturecreateurToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :naturecreateur, :string
  end
end
