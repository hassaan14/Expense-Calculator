class RemoveNameIdFromCashrecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :cashrecords, :name_id, :integer
  end
end
