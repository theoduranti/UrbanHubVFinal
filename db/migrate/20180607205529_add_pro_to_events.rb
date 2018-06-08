class AddProToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :pro, foreign_key: true
  end
end
