class AddOpeningsToCourseTable < ActiveRecord::Migration
  def change
    add_column :courses, :openings, :integer, :default => 0
  end
end
