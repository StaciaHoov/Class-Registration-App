class Course < ActiveRecord::Base
    belongs_to :user
    belongs_to :student
    
    default_scope { order('age_group DESC','time_block ASC') } 
    
    validates :title, length: { maximum: 10 }, presence: true
    validates :user, presence: true
    validates :age_group, presence: true
    
    def openings
        if self.max_students != nil
            self.max_students
        end
    end

    def self.list_by_age_time
        Course.all.group_by(&:age_group).map do |age_group, array_age|  
            [age_group, array_age.group_by(&:time_block)]
        end
     
    end
end

