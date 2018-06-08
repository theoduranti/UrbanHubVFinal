class AddColumnsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
    add_column :events, :description, :text
    add_column :events, :discipline, :string
    add_column :events, :date, :string
    add_column :events, :ville, :string
    add_column :events, :departement, :string
    add_column :events, :prix, :decimal
  end
end
