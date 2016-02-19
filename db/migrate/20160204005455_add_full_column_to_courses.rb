class AddFullColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_full, :boolean, default: false
    add_column :courses, :seats_taken, :integer, default: 0
  end
end
