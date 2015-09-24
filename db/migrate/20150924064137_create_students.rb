class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :enroll_no, limit: 30, default: "", null: false
    	t.string :first_name, limit: 30, default: "", null: false,	index:true
    	t.string :last_name, limit: 30, default: "", null: false,	index:true
			t.string	:email, limit: 60, default: "", null: false, index: true
			t.integer	:gender,	default: 0, null: false
			t.date	:date_of_birth
			t.string	:phone
			t.text	:address
			t.timestamps
    end
  end
end
