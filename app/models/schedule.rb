class Schedule < ActiveRecord::Base
    belongs_to :student
    has_many :courses 
    
    before_destroy :make_course_avail

    after_save :reset_course_full 
    
    def make_course_avail
        course_all_blocks
        @course_first_block.downcount_seats if @course_first_block
        @course_second_block.downcount_seats if @course_second_block
        @course_third_block.downcount_seats if @course_third_block

    end
        
    def reset_course_full
        course_all_blocks
        @course_first_block.upcount_seats if @course_first_block
        @course_second_block.upcount_seats if @course_second_block
        @course_third_block.upcount_seats if @course_third_block        
    end
    
    private
    
    def course_all_blocks
        @course_first_block = Course.where(id: self.first_course_id).last
        @course_second_block = Course.where(id: self.second_course_id).last
        @course_third_block = Course.where(id: self.third_course_id).last 
    end
    
    
end
