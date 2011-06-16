Factory.sequence :email do |n|
  "email#{n}@mailinator.com"
end

Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password '123123'
  f.password_confirmation '123123'
end