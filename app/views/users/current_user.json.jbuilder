json.user do
  json.call(current_user, :id, :email, :username)
end
