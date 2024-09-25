require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'
require_relative 'course_subject'
require_relative 'student_subject'

def display_student_details_with_subjects
  puts "Input Student ID to display details: "
  student_id = gets.chomp.to_i
  student = Student.find(student_id)

  if student
    puts "Student Details:"
    puts student.display
    puts "Enrolled Subjects:"
    subjects = student.subjects
    subjects.each do |subject|
      puts "Subject ID: #{subject.id}, Name: #{subject.name}"
    end
  else
    puts "No enrolled subjects."
  end
end

def enroll_student_in_course_subjects(student_id, course_id)
  course = Course.find(course_id)
  return course
  course.subjects.each do |subject|
    student_subject = StudentSubject.new(nil, student_id, subject.id)
    student_subject.save
  end
end

def display_course_details
  puts "Input Course ID to display details: "
  course_id = gets.chomp.to_i
  course = Course.find(course_id)

  if course
    puts "Course Details: ID: #{course.id}, Name: #{course.name}"
    display_course_subjects(course_id)
  else
    puts "Course not found."
  end
end

def display_course_students(course)
  puts "Students added in course ID #{course.id}"
  students = course.students
  if students.empty?
    puts "No students enrolled in this course."
  else
    students.each { |student| student.display }
  end
end

def display_course_subjects(course_id)
  subjects = CourseSubject.find_by_course_id(course_id)

  if subjects
    puts "Subjects successfully assigned to Course ID #{course_id}:"
  else
    puts "No subjects available."
    subjects.each { |subject| puts subject.display }
  end
end

def add_subjects_to_course
  display_courses
  puts "Input Course ID to add subjects: "
  course_id = gets.chomp.to_i

  while true
    puts "Input Subject to add, (type exit if done): "
    answer = gets.chomp
    puts "Subject added successfully"
    break if answer.downcase == 'exit'

    subject_id = answer.to_i
    if Subject.find(subject_id)
      existing_record = CourseSubject.all.find { |cs| cs.course_id == course_id && cs.subject_id == subject_id }
      unless existing_record
        course_id = CourseSubject.all.size + 1
        course_subject = CourseSubject.new(course_id, subject_id)
        course_subject.save
        puts CourseSubject.display
      end
    end
  end
end

def remove_subjects_from_course
  puts "Input course ID to remove subject: "
  course_id = gets.chomp.to_i
  subjects = CourseSubject.find_by_course_id(course_id)
  if subjects.empty?
    puts "No subject found."
  else
    while true
      display_course_subjects(course_id)
      puts "Input Subject to remove (type exit if done): "
      input = gets.chomp
      break if input.downcase == 'exit'
      subject_id = input.to_i
      cs_record = subjects.find { |cs| cs.subject_id == subject_id }
      if cs_record
        cs_record.destroy
        subjects.delete(cs_record)
      else
        puts "Subject is not with this course."
      end
    end
  end
end

def new_teacher
  puts "Add a new teacher"
  teacher_id = Teacher.all.size + 1
  puts "Input teacher name:"
  teacher_name = gets.chomp
  puts "Input teacher birthdate (mm/dd/yyyy):"
  teacher_birthdate = gets.chomp
  puts "Input teacher email:"
  teacher_email = gets.chomp
  puts "Input teacher phone number:"
  teacher_phone_number = gets.chomp
  puts "Input teacher department:"
  teacher_department = gets.chomp
  teacher = Teacher.new(teacher_id, teacher_name, teacher_birthdate, teacher_email, teacher_phone_number, teacher_department)
  teacher.save

  if Teacher.find(teacher_id)
    puts teacher.display
  else
    puts "Teacher not added."
  end
end

def delete_teacher
  puts "Delete a teacher"
  puts "Input teacher ID to delete:"
  teacher_id = gets.chomp.to_i

  if teacher = Teacher.find(teacher_id)
    teacher.destroy
    puts "Teacher destroyed successfully."
  else
    puts "Teacher ID not destroyed."
  end
end

def display_teachers
  puts "Display all teachers"
  Teacher.all.each do |teacher|
    puts teacher.display
  end
end

def edit_teacher
  puts "Input Teacher ID to edit: "
  id = gets.chomp.to_i
  teacher = Teacher.find(id)
  if teacher
    puts "Enter New Teacher Name: "
    teacher.name = gets.chomp
    puts "Enter New Birth Date: "
    teacher.birth_date = gets.chomp
    puts "Enter New Email: "
    teacher.email = gets.chomp
    puts "Enter New Phone Number: "
    teacher.phone_number = gets.chomp
    puts "Enter New Department: "
    teacher.department = gets.chomp
    teacher.save
  else
    puts "Teacher not found."
  end
end

def new_subject
  puts "Add new subject"
  subject_id = Subject.all.size + 1
  puts "Enter a new subject"
  subject_name = gets.chomp
  subject = Subject.new(subject_id, subject_name)
  subject.save

  if Subject.find(subject_id)
    puts "Subject added successfully!"
    puts subject.display
  else
    puts " Subject not added"
  end
end

def delete_subject
  puts "Delete a subject"
  puts "Input subject ID to delete:"
  subject_id = gets.chomp.to_i

  if subject = Subject.find(subject_id)
    subject.destroy
    puts "Subject destroyed successfully!"
  end
end

def edit_subject
  puts "Input Subject ID to edit: "
  id = gets.chomp.to_i
  subject = Subject.find(id)
  if subject
    puts "Enter New Subject Name: "
    subject.name = gets.chomp
    subject.save
  else
    puts "Subject not found."
  end
end

def display_subjects
  puts "Display all subjects"
  Subject.all.each do |subject|
    puts subject.display
  end
end

def new_course
  puts "Add new course"
  course_id = Course.all.size + 1
  puts "Add a new course:"
  course_name = gets.chomp
  course = Course.new(course_id, course_name)
  course.save

  if Course.find(course_id)
    puts course.display
  end
end

def delete_course
  puts "Delete a course:"
  puts "Input course ID:"
  course_id = gets.chomp.to_i

  if course = Course.find(course_id)
    course.destroy
    puts "Course destroyed successfully!"
  else
    puts "Course not found"
  end
end

def display_courses
  puts "Display all courses"
  Course.all.each do |course|
    puts course.display
  end
end

def edit_course
  puts "Input Course ID to edit: "
  id = gets.chomp.to_i
  course = Course.find(id)
  if course
    puts "Input New Course Name: "
    course.name = gets.chomp
    course.save
  else
    puts "Course not found."
  end
end

def new_student
  puts "Add new student"
  student_id = Student.all.size + 1
  puts "Enter student name:"
  student_name = gets.chomp
  puts "Enter student birth date (mm/dd/yyyy):"
  student_birth_date = gets.chomp
  puts "Enter student email:"
  student_email = gets.chomp
  puts "Enter student phone number:"
  student_phone_number = gets.chomp

  display_courses
  puts "Input Course ID for the student: "
  course_id = gets.chomp.to_i

  student = Student.new(student_id, student_name, student_birth_date, student_email, student_phone_number, course_id)
  student.save

  if Student.find(student_id)
    enroll_student_in_course_subjects(student_id, course_id)
    puts "Student added and enrolled successfully!"
  end
end

def delete_student
  puts "Delete a student"
  puts "Input student ID you want to delete:"
  student_id = gets.chomp.to_i

  if student = Student.find(student_id)
    student.destroy
    puts "Student destroyed successfully!"
  end
end

def display_students
  puts "Display all students"
  Student.all.each do |student|
    puts student.display
  end
end

def edit_student
  puts "Input Student ID to edit: "
  id = gets.chomp.to_i
  student = Student.find(id)

  if student
    puts "Input New Student Name: "
    student.name = gets.chomp
    puts "Input New Birth Date: "
    student.birth_date = gets.chomp
    puts "Input New Email: "
    student.email = gets.chomp
    puts "Input New Phone Number: "
    student.phone_number = gets.chomp

    display_courses
    puts "Input New Course ID for the student: "
    student.course_id = gets.chomp.to_i
    student.save
  else
    puts "Student not found."
  end
end

def menu
  while true
    puts "School Management:"
    puts "1. Student Management"
    puts "2. Course Management"
    puts "3. Subject Management"
    puts "4. Teacher Management"
    puts "5. Exit"
    answer = gets.chomp.to_i

    case answer
    when 1
      student_management
    when 2
      course_management
    when 3
      subject_management
    when 4
      teacher_management
    when 5
      puts "Exit program"
      break
    else
      puts "Student not found"
    end
  end
end

def teacher_management
  while true
    puts "Teacher Management"
    puts "1. Add a new teacher"
    puts "2. Delete a teacher"
    puts "3. Display all teachers"
    puts "4. Edit a teacher"
    puts "5. Back to School Management"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_teacher
    when 2
      delete_teacher
    when 3
      display_teachers
    when 4
      edit_teacher
    when 5
      puts "Exit program"
      break
    end
  end
end

def subject_management
  while true
    puts "Subject Management"
    puts "1. Add a new subject"
    puts "2. Delete a subject"
    puts "3. Display all subjects"
    puts "4. Edit a subject"
    puts "5. Back to School Management"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_subject
    when 2
      delete_subject
    when 3
      display_subjects
    when 4
      edit_subject
    when 5
      puts "Exit program"
      break
    end
  end
end

def course_management
  while true
    puts "Course Management"
    puts "1. Add a new course"
    puts "2. Delete a course"
    puts "3. Display all courses"
    puts "4. Display course details"
    puts "5. Add subjects to course"
    puts "6. Remove subjects from course"
    puts "7. Edit a course"
    puts "8. Back to School Management"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_course
    when 2
      delete_course
    when 3
      display_courses
    when 4
      display_course_details
    when 5
      add_subjects_to_course
    when 6
      remove_subjects_from_course
    when 7
      edit_course
    when 8
      puts "Exit program"
      break
    end
  end
end

def student_management
  while true
    puts "Student Management"
    puts "1. Add a new student"
    puts "2. Delete a student"
    puts "3. Display all students"
    puts "4. Display student details with subjects"
    puts "5. Edit a student"
    puts "6. Back to School Management"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_student
    when 2
      delete_student
    when 3
      display_students
    when 4
      display_student_details_with_subjects
    when 5
      edit_student
    when 6
      puts "Exit program"
      break
    end
  end
end

menu