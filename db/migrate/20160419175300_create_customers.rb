class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.datetime :register_date
      t.string :first_name,default: ''
      t.string :middle_name,default: ''
      t.string :last_name,default: ''
      t.integer :marital_status
      t.string :email,default: ''
      t.integer :gender
      t.string :spouse,default: ''
      t.integer :zipcode
      t.string :main_phone,default: ''
      t.string :secondary_phone,default: ''
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
