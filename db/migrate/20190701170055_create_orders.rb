class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :total
      t.date :rent_day
      t.date :return_day
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
