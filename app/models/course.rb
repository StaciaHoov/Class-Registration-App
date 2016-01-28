class Course < ActiveRecord::Base
    belongs_to :user
    has_many :enrollments
    has_many :schedules
    has_many :students, through: :enrollments
    
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


    def self.list_by_age_time
        Course.all.group_by(&:age_group).map do |age_group, array_age|  
            [age_group, array_age.group_by(&:time_block)]
        end
    end
    
    def self.list_by_time_age
       Course.all.group_by(&:time_block ).map do |time_group, array_time|  
            [time_group, array_time.group_by(&:age_group)]
        end
    end
end

