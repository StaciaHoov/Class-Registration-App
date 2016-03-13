class ChangeDataTypeforWaitlistStudentTable < ActiveRecord::Migration
  def change
    change_column :waitlist_students, :waitlist_id, :integer
  end
end
