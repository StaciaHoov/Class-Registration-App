class AddRoomToCourseTable < ActiveRecord::Migration
  def change
    add_column :courses, :room, :string
  end
end
