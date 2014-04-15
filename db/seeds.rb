# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Admin.create(email: 'admin@admin.com', password: '12341234', password_confirmation: '12341234')

User.create(name: 'New Student', password: '12341234', password_confirmation: '12341234', email: 'student@student.com')
Teacher.create(name: 'New Teacher', password: '12341234', password_confirmation: '12341234', email: 'teacher@teacher.com')