class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.datetime :register_date
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :marital_status
      t.string :email
      t.integer :gender
      t.string :spouse
      t.integer :zipcode
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
