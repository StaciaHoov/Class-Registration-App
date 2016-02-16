class Course < ActiveRecord::Base
    belongs_to :user
    has_many :schedules
    has_many :waits
    
    default_scope { order('time_block ASC','age_group DESC') } 
    
    validates :title, length: { maximum: 40 }, presence: true
    validates :user, presence: true
    validates :age_group, presence: true
    validates :max_students, presence: true
    validates :time_block, presence: true
    
    
    def upcount_seats
        if Schedule.where(first_course_id: self.id) || Schedule.where(second_course_id: self.id) ||
            Schedule.where(third_course_id: self.id)
            self.increment!(:seats_taken)
        end
        check_full
    end
    
    def downcount_seats
        if Schedule.where(first_course_id: self.id) || Schedule.where(second_course_id: self.id) ||
        Schedule.where(third_course_id: self.id)
            self.decrement!(:seats_taken)
        end
        check_full
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

