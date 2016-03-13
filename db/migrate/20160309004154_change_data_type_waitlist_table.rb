class ChangeDataTypeWaitlistTable < ActiveRecord::Migration
  def change
    rename_column :waitlists, :wait_list_student_id, :waitlist_student_id
  end
end
