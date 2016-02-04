class AddFullColumnToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_full, :boolean, default: false
  end
end
