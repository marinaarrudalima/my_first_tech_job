class AddStatusDefault < ActiveRecord::Migration[7.1]
  def change
    change_column_default :matches, :status, from: nil, to: 0
  end
end
