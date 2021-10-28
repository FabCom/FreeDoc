class Specialty < ApplicationRecord
  has_many :assignment_specialties
  has_many :doctors, through: :assignment_specialties
end
