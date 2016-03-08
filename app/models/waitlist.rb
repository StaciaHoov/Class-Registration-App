class Waitlist < ActiveRecord::Base
    has_many :course_wait_students
    has_many :users, through :course_wait_student
    
end
