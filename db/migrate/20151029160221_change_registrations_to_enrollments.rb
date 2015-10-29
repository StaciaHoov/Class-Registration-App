class ChangeRegistrationsToEnrollments < ActiveRecord::Migration
  def self.up
    rename_table :registrations, :enrollments
  end
  
  def self.down
    rename_table :enrollments, :registrations
  end
end

