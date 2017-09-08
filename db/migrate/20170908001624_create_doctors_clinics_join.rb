class CreateDoctorsClinicsJoin < ActiveRecord::Migration
  def change
    create_table :doctors_clinics_joins, id: false do |t|
      t.column :doctor_id, :integer
      t.column :clinic_id, :integer
    end
  end
end
