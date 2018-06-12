class AddAsubscribeToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :asubscribe, :integer, array:true, default: []
  end
end
