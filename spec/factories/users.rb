FactoryBot.define do
  factory :user do
    name                  {'test'}
    email                 {'test@example'}
    password              {'000abc'}
    password_confirmation {password}
  end
end