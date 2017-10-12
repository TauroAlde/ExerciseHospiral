class AddFieldsToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :admin_user_full_name, :string
    add_column :admin_users, :department_id, :integer
  end
end
