class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :asubscribe2, :integer, array:true, default: []
    add_column :events, :asubscribe3, :integer, array:true, default: []
    add_column :events, :asubscribe4, :integer, array:true, default: []
    add_column :events, :asubscribe5, :integer, array:true, default: []
    add_column :events, :asubscribe6, :integer, array:true, default: []
    add_column :events, :asubscribe7, :integer, array:true, default: []
    add_column :events, :asubscribe8, :integer, array:true, default: []
    add_column :events, :asubscribe9, :integer, array:true, default: []
    add_column :events, :asubscribe10, :integer, array:true, default: []
  end
end
