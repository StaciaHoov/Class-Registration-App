class Course < ActiveRecord::Base
    belongs_to :user
    belongs_to :student
    
    def openings
        if self.max_students != nil
            self.max_students
        end
    end
end
