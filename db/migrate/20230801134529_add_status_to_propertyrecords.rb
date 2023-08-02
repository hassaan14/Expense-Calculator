class AddStatusToPropertyrecords < ActiveRecord::Migration[7.0]
  def change
    add_column :propertyrecords, :status, :string, default: 'active', null: false
  end
end
