class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :console, index: true
      t.string :name
      t.float :price
      t.string :type
      t.integer :quantity

      t.timestamps
    end
  end
end
