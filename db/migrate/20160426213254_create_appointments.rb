class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.time :time
      t.string :place
      t.string :status, default: :upcoming
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
