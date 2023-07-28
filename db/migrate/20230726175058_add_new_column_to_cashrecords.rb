class AddNewColumnToCashrecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :cashrecords, :propertyrecord, null: false, foreign_key: true
  end
end
