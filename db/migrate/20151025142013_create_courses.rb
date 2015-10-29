class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.time :time_block
      t.string :age_group
      t.integer :max_students
      t.float :fee
      t.date :session
      t.timestamps null: false
    end
  end
end
