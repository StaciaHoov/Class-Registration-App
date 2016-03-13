class Waitlist < ActiveRecord::Base
    belongs_to :course
    has_many :waitlist_students, dependent: :destroy
    has_many :students, through: :waitlist_students
end
