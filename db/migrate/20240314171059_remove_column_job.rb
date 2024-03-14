class RemoveColumnJob < ActiveRecord::Migration[7.1]
  def change
    remove_column :jobs, :tech_interests
  end
end
