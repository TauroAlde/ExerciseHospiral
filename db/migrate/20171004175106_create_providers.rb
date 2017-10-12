class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.boolean :active
      t.text :address
      t.string :name
      t.integer :priority
      t.timestamps null: false
    end
  end
end
