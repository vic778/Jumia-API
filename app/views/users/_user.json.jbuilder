json.call(user, :id, :email, :name)
json.token user.generate_jwt
