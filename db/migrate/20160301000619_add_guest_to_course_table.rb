class AddGuestToCourseTable < ActiveRecord::Migration
  def change
    add_column :courses, :guest_teacher, :string
  end
end
