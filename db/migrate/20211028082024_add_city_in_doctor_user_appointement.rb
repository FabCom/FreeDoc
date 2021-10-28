class AddCityInDoctorUserAppointement < ActiveRecord::Migration[5.2]
  def change
    change_table :patients do |t|
      t.belongs_to :city, index: true
    end

    change_table :doctors do |t|
      t.belongs_to :city, index: true
      t.remove :zip_code
    end

    change_table :appointments do |t|
      t.belongs_to :city, index: true
    end
  end
end
