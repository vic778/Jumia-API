ActiveAdmin.register Post do
  permit_params :title, :description, :model, :price, :connexion, :cpu, :gpu, :system, :battery, :camera, :memory, :display, :image, :drawer_id
end