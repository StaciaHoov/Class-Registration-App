class ChangeWaitTable < ActiveRecord::Migration
  def change
    rename_column :courses, :openings, :seats_taken
  end
end
