class Course < ActiveRecord::Base
    belongs_to :user
    has_many :schedules
    has_many :students, through: :schedules
    
    default_scope { order('time_block ASC','age_group DESC') } 
    
    validates :title, length: { maximum: 40 }, presence: true
    validates :user, presence: true
    validates :age_group, presence: true
    
    def openings
        course_enrollments = Schedule.where(first_course_id: self.id).length +
        Schedule.where(second_course_id: self.id).length +
        Schedule.where(third_course_id: self.id).length
        
        if self.max_students != nil
            self.max_students - course_enrollments
        end
    end
    
    def check_full
        if self.openings <= 0
            self.update_attribute(:course_full, 'true')
        end
    end

end

