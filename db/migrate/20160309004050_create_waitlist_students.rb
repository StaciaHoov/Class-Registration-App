class CreateWaitlistStudents < ActiveRecord::Migration
  def change
    create_table :waitlist_students do |t|
      t.integer :student_id
      t.string :waitlist_id

      t.timestamps null: false
    end
  end
end
