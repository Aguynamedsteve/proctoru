# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   Character.create(name: 'Luke', movie: movies.first)

20.times do 
    college = College.create({ name: Faker::University.name })
  3.times do 
    exam = college.exams.create({ title: Faker::Educator.course_name })
    exam.create_exam_window({ start_time: DateTime.parse(2.hours.ago.to_s), end_time: DateTime.now })
  end
end

Exam.all.each do |exam|
  5.times do
  User.create({
                first_name: Faker::Name.first_name, 
                last_name: Faker::Name.last_name, 
                phone_number: Faker::PhoneNumber.phone_number,
                exam_id: exam.id,
                college_id: exam.college_id
              })
  end
end