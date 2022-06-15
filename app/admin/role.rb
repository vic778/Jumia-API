ActiveAdmin.register Role do
  permit_params :name, :permissions, permissions_attributes: %i[id action resource _destroy]
end
