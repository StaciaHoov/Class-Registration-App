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
end
