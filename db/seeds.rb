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

20.times do |n|
  content = Faker::Name.name
  subject_id = 1
  4.times do |m|
    answers["#{m}"] = {content: "Answer #{m}", is_correct: true}
  end
  Question.create!(content: content, subject_id: subject_id,
      answers_attributes: answer)
end
