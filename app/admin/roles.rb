ActiveAdmin.register Role do
    permit_params :role_name

    index do
        selectable_column
        id_column
        column :role_name
        column :created_at
        actions
    end

    form do |f|
        f.inputs do
            f.inputs :role_name
        end
        f.actions
    end
end
