# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :weigh_in do
    date Date.today
    weight 86.23
  end
end
