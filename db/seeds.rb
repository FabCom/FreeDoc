# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
Patient.destroy_all
Doctor.destroy_all
Appointment.destroy_all


["Allauch","Carnoux-en-Provence","Carry-le-Rouet","Cassis","Ceyreste","Châteauneuf-les-Martigues","La Ciotat","Ensuès-la-Redonne","Gémenos","Gignac-la-Nerthe","Marignane","Marseille","Plan-de-Cuques","Roquefort-la-Bédoule","Le Rove","Saint-Victoret","Sausset-les-Pins","Septèmes-les-Vallons"].each do |current|
  City.create(name: current)
end

["allergologie","anesthésiologie","cardiologie","chirurgie","dermatologie","endocrinologie","gastro-entérologie","gériatrie","gynécologie","hématologie","neurologie","odontologie","oncologie","obstétrique","pédiatrie", "pneumologie","psychiatrie","radiologie"].each do |current|
  Specialty.create(name: current)
end

100.times do
  Patient.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample(1)[0])
end

20.times do
  d = Doctor.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  d.city = City.all.sample(1)[0]
  rand(1..3).times do
    AssignmentSpecialty.create(doctor: d, specialty: Specialty.all.sample(1)[0])
  end
  d.save
end

200.times do
  a =  Appointment.new(date: Faker::Time.forward(days: 365,  period: :day, format: :short), doctor: Doctor.all.sample(1)[0], patient: Patient.all.sample(1)[0])
  a.city = [a.doctor.city, a.patient.city].sample(1)[0]
  a.save
end
