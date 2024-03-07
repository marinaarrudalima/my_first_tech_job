class AddColumnCandidate < ActiveRecord::Migration[7.1]
  def change
    add_column :candidates, :birth_date, :date
  end
end
