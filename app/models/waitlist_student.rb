class WaitlistStudent < ActiveRecord::Base
    belongs_to :waitlist
    belongs_to :student
    
    validates :student_id, presence: true
    validates :waitlist_id, presence: true
    validates_uniqueness_of :student_id, :scope => :waitlist_id
    
end
