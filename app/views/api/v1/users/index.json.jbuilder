json.users @users do |user|
  json.user(user, :id, :name, :weight,
                  :dob, :race, :hair_color, 
                  :eye_color, :alive, :age)
  json.url api_v1_user_url(user)
end