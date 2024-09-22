require_relative 'student'
require_relative 'course'
require_relative 'subject'
require_relative 'teacher'

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
    puts "Teacher added successfully!"
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
    puts" Subject not added"
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
    puts "Course added successfully!"
    puts course.display
  else
    puts "Course not added"
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

def new_student
  puts"Add new student"
  student_id = Student.all.size + 1
  puts "Enter student name:"
  student_name = gets.chomp
  puts "Enter student birth date (mm/dd/yyyy):"
  student_birth_date = gets.chomp
  puts "Enter student email:"
  student_email = gets.chomp
  puts "Enter student phone number:"
  student_phone_number = gets.chomp

  student =Student.new(student_id, student_name, student_birth_date, student_email, student_phone_number)
  student.save

  if Student.find(student_id)
    puts "Student added successfully!"
    student.display
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

def menu
  while true
    puts "Choose an action:"
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
    puts "4. Exit"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_teacher
    when 2
      delete_teacher
    when 3
      display_teachers
    when 4
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
    puts "4. Exit"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_subject
    when 2
      delete_subject
    when 3
      display_subjects
    when 4
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
    puts "4. Exit"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_course
    when 2
      delete_course
    when 3
      display_courses
    when 4
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
    puts "4. Exit"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_student
    when 2
      delete_student
    when 3
      display_students
    when 4
      puts "Exit program"
      break
    end
  end
end
menu