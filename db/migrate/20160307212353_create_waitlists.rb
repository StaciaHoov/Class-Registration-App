class CreateWaitlists < ActiveRecord::Migration
  def change
    create_table :waitlists do |t|
      t.integer :course_id
      t.integer :wait_list_student_id
      t.timestamps null: false
    end
  end
end
