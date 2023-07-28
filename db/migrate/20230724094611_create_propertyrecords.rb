class CreatePropertyrecords < ActiveRecord::Migration[7.0]
  def change
    create_table :propertyrecords do |t|
      t.string :name
      t.text :description
      t.string :category
      t.text :notes

      t.timestamps
    end
  end
end
