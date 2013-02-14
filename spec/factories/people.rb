# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    name 'Testalot'
    height 1.82
    target_bmi 19.7
    after(:create) do |person|
      person.weigh_ins << FactoryGirl.create(:weigh_in, person: person)
    end
  end
end
