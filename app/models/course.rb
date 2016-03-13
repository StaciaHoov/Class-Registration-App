class Course < ActiveRecord::Base
    belongs_to :user
    has_many :schedules
    has_one :waitlist, dependent: :destroy
    
    default_scope { order('time_block ASC','age_group DESC') } 
    
    validates :title, length: { maximum: 40 }, presence: true
    validates :user, presence: true
    validates :age_group, presence: true
    validates :max_students, presence: true
    validates :time_block, presence: true
    
    
    def upcount_seats
        self.increment!(:seats_taken)
        check_full
    end
    
    def downcount_seats
        self.decrement!(:seats_taken)
        check_full
    end
      
    def students_waiting
        list = self.waitlist
        WaitlistStudent.where(waitlist_id: list.id)
    end
    
    private
    
    def check_full
        if self.max_students - self.seats_taken <= 0
            self.update_attribute(:course_full, 'true')
        else
            self.update_attribute(:course_full, 'false')
        end
    end

end

