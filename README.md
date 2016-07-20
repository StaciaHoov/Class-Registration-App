# WHO Class Registration App


## Summary
The WHO Class Registration App was designed for a community education cooperative where adult members teach classes to students of varying age-groups in the community. 
The App is used as a planning tool, allowing members to sign-up to teach courses & plan sessions, as well as for registration so members can sign
themselves or their children up to take classes.

## Features
* Users can sign up as members. 
* From the My Account tab, members can:
    * edit their user information (name, email) 
    * add themselves or their children as students
    * sign up their students for classes
    * view and edit their teaching schedule 
* Members can sign up to teach courses, and designate teaching preferences such as room, time, maximum number of students, fee, age-group, and co-teacher.
* On the Class Planning page, in-place editing is possible to change course time.
* Courses can be viewed from the Current Class Offerings table, which shows number of openings per course. As students register a course,
 the Openings field increments down until all seats are taken. Table then displays 'Course Full'.
* Class Offerings are tabulated by age-group. Jumping to different tables is possible via anchor links throughout the page.
* Each table has sortable columns.
* A class roster of registered students is available from the teacher's My Account page and from the course description page.


## Technologies    
####Languages, Libraries, and Frameworks:    
* Ruby on Rails v4.2.1
* jQuery
* AJAX
* Bootstrap   

####Databases: 
* SQLite (Development)
* PostgreSQL (Production)   

####Development Tools, Gems and Methodologies:       
* Figaro to manage sensitive information        
* Devise for user authentication        
* Pundit for user authorization  
* Simple_form for simple, flexible forms
* Cocoon for forms that handle nested models and attributes dynamically using jQuery
* DataTables to add client-side functionality to plain HTML tables including pagination, 
sorting, and searching.
* Best_in_place - In-place editor that uses jQuery to allow users to edit content in-place, without forms. 


    
## Deployment    
You can view the app on Heroku: [WHO Registration App](https://who-registration.herokuapp.com/)

