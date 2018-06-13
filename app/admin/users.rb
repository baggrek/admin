ActiveAdmin.register User do
    permit_params :first_name, :last_name, :address, :tlp, :email, :password

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :address
    column :tlp
    column :email
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs do
        f.input :first_name
        f.input :last_name
        f.input :address
        f.input :tlp
        f.input :email
        f.input :password
    end
    f.actions
  end
end
