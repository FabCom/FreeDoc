class Doctor < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_many :assignment_specialties
  has_many :specialties, through: :assignment_specialties
  belongs_to :city
end
