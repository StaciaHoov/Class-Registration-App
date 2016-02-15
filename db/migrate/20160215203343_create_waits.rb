class CreateWaits < ActiveRecord::Migration
  def change
    create_table :waits do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
