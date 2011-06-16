Factory.sequence :email do |n|
  "email#{n}@mailinator.com"
end

Factory.sequence :code do |n|
  "code#{n}"
end

Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password '123123'
  f.password_confirmation '123123'
end

Factory.define :country do |f|
  f.code { Factory.next(:email)}
  f.name 'USA'
  f.association :user
end

