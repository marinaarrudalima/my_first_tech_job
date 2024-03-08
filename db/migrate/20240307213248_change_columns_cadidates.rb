class ChangeColumnsCadidates < ActiveRecord::Migration[7.1]
  def change
    remove_column :candidates, :terms_condition
    add_column :candidates, :terms_conditions, :boolean
  end
end
