class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :first_course_id
      t.integer :second_course_id
      t.integer :third_course_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
