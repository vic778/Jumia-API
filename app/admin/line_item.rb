ActiveAdmin.register LineItem do
  permit_params :id, :cart_id, :post_id
end
