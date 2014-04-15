# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    user nil
    class_room nil
    title "MyString"
  end
end
