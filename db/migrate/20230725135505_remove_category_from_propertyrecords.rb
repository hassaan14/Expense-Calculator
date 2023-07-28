class RemoveCategoryFromPropertyrecords < ActiveRecord::Migration[7.0]
  def change
    remove_column :propertyrecords, :category, :string
  end
end
