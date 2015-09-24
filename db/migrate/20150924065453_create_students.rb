class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :enroll_no, limit: 30, default: "", null: false, index:true, :unique => true
      t.string  :first_name, limit: 30, default: "", null: false,  index:true
      t.string  :last_name, limit: 30, default: "", null: false, index:true
      t.string  :email, limit: 60, default: "", null: false, :unique => true, index: true
      t.integer :gender
      t.date    :date_of_birth
      t.string  :phone
      t.string  :address1, default: "", null: false
      t.string  :address2, default: "", null: false
      t.string  :city, limit: 50
      t.string  :country, limit: 50
      t.string  :postcode, limit: 10, default: "", null: false
      t.string  :avatar
      t.integer :status, default: 1, null: false
      t.boolean :deleted, default: 0, null: false      
      t.timestamps
    end
  end
end
