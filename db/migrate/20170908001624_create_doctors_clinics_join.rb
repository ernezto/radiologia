class CreateDoctorsClinicsJoin < ActiveRecord::Migration
  def change
    create_table :clinics_doctors, id: false do |t|
      t.column :doctor_id, :integer
      t.column :clinic_id, :integer
    end
  end
end
