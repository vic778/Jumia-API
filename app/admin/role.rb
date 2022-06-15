ActiveAdmin.register Role do
    permit_params :name, :permissions, :permissions_attributes => [:id, :action, :resource, :_destroy]
end