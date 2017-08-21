class CreateSignInRegistries < ActiveRecord::Migration
  def change
    create_table :sign_in_registries do |t|
      t.integer :admin_user_id
      t.datetime :login_day
      t.timestamps null: false
    end
  end
end
