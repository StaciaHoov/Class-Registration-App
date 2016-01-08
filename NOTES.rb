def first_course
    student_schedule = Schedule.where(student_id: student.id).last
    first_course = Course.where(id: student_schedule.first_course_id).last
end

 
    @student_schedule = Schedule.where(student_id: student.id).last
    @first_course =  Course.where(id: student_schedule.first_course_id).last