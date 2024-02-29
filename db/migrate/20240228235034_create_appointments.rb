class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.datetime :appointment_time, null: false
      t.string :status
      t.integer :duration, limit: 4
      t.float :price, limit: 24

      t.timestamps
    end
  end
end
