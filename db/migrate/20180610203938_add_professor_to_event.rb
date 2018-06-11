class AddProfessorToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :professor_id, :integer
  end
end
