class AddIndexToSchedule < ActiveRecord::Migration
  def change
    add_index :schedules, [:student_id], unique: true
  end
end
