class CreateCashrecords < ActiveRecord::Migration[7.0]
  def change
    create_table :cashrecords do |t|
      t.references :name, null: false, foreign_key: true
      t.float :amount
      t.text :notes

      t.timestamps
    end
  end
end
