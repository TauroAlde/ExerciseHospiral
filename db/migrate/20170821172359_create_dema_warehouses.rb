class CreateDemaWarehouses < ActiveRecord::Migration
  def change
    create_table :dema_warehouses do |t|
      t.string :item_name
      t.string :department_belongs
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
