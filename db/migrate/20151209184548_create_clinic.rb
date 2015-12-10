class CreateClinic < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :phone
      t.string :address
    end
  end
end
