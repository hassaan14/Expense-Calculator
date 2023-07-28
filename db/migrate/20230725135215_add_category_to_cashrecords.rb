class AddCategoryToCashrecords < ActiveRecord::Migration[7.0]
  def change
    add_column :cashrecords, :category, :string
  end
end
