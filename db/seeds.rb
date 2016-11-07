User.create! name: "abc",
  email: "abc@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true

10.times do |n|
  name = Faker::Name.name
  email = "abc-#{n+1}@gmail.com"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
