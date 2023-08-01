class AddNewColumnToPropertyrecords < ActiveRecord::Migration[7.0]
  def change
    add_column :propertyrecords, :Is_deleted, :string
  end
end
