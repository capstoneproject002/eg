# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :class_rooms_user, :class => 'ClassRoomsUsers' do
    user nil
    class_room nil
    gpa 1
    score 1
    attendance 1
  end
end
