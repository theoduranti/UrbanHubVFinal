class AddColumnProfesseurToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :professeur, :string
  end
end
