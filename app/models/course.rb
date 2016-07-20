class Course < ActiveRecord::Base
    belongs_to :user
    has_one :waitlist, dependent: :destroy
    has_many :waitlist_students, through: :waitlist, dependent: :destroy
    
    default_scope { order('time_block ASC','age_group DESC') } 
    
    validates :title, length: { maximum: 40 }, presence: true
    validates :age_group, presence: true
    validates :max_students, presence: true
    validates :time_block, presence: true
    
    before_destroy :delete_schedules
   
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
    
    def delete_schedules
        schedule_first_course = Schedule.where(first_course_id: self.id) 
        schedule_second_course = Schedule.where(second_course_id: self.id) 
        schedule_third_course = Schedule.where(third_course_id: self.id) 
        
        if schedule_first_course.any?
            schedule_first_course.delete_all
        end
        
        if schedule_second_course.any?
            schedule_second_course.delete_all
        end
        
        if schedule_third_course.any?
            schedule_third_course.delete_all
        end
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

