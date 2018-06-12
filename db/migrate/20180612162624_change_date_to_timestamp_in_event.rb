class ChangeDateToTimestampInEvent < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :date, :timestamp
  end
end
