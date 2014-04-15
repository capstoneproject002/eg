# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_room do
    teacher nil
    semester nil
    name "MyString"
  end
end
