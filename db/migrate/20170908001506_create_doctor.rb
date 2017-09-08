class CreateDoctor < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :lastname
      t.string :mobile
      t.string :landline
      t.string :dni
      t.string :email
    end
  end
end
