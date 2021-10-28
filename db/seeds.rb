# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all

100.times do
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

20.times do
  d = Doctor.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  d.speciality = ["allergologie","anesthésiologie","cardiologie","chirurgie","dermatologie","endocrinologie","gastro-entérologie","gériatrie","gynécologie","hématologie","neurologie","odontologie","oncologie","obstétrique","pédiatrie", "pneumologie","psychiatrie","radiologie"].sample(1)[0]
  d.zip_code = ["13001","13002","13003","13004","13005","13006","13007","13008","13009","13010","13011","13012","13013","13014","13015","13016"].sample(1)[0]
  d.save
end

200.times do
  I18n.locale = 'fr'
  Appointment.create(date: Faker::Time.forward(days: 365,  period: :day, format: :short), doctor: Doctor.all.sample(1)[0], patient: Patient.all.sample(1)[0] )
end
