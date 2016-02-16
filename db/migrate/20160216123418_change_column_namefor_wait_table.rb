class ChangeColumnNameforWaitTable < ActiveRecord::Migration
  def change
    def self.up
      rename_table  :enrollments, :openings
    end
  
    def self.down
      rename_table :openings, :enrollments
    end
  end
end
