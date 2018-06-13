class AddOthersColumnsToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :etat, :string
    add_column :events, :apayer, :integer, array:true, default: []
    add_column :events, :apayer2, :integer, array:true, default: []
    add_column :events, :apayer3, :integer, array:true, default: []
    add_column :events, :apayer4, :integer, array:true, default: []
    add_column :events, :apayer5, :integer, array:true, default: []
    add_column :events, :apayer6, :integer, array:true, default: []
    add_column :events, :apayer7, :integer, array:true, default: []
    add_column :events, :apayer8, :integer, array:true, default: []
    add_column :events, :apayer9, :integer, array:true, default: []
    add_column :events, :apayer10, :integer, array:true, default: []
  end
end
