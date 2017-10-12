ActiveAdmin.register AdminUser do
  permit_params :admin_user_full_name, :department, :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :admin_user_full_name
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end
  show do

    attributes_table do
      row :sign_in_registry do |admin_user|
        admin_user.sign_in_registries.to_day_login_for(admin_user.id).login_day.strftime("%e/%m/%y %H:%M")
      end
    end
  end
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :admin_user_full_name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
