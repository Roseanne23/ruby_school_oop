require_relative 'student'
require_relative 'course'

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

new_student

def delete_student
  puts "Delete a student"
  puts "Input student ID you want to delete:"
  student_id = gets.chomp.to_i

  if student = Student.find(student_id)
     student.destroy
     puts "Student destroyed successfully!"
  end
end

def menu
  while true
    puts "Choose an action:"
    puts "1. Add a new student"
    puts "2. Delete a student"
    puts "3. Add a new course"
    puts "4. Delete a course"
    puts "5. Exit"
    answer = gets.chomp.to_i

    case answer
    when 1
      new_student
    when 2
      delete_student
    when 3
      new_course
    when 4
      delete_course
    when 5
      puts "Exit program"
    break
    else
      puts "Student not found"
    end
  end
end

def course_management
  while true
    puts "Course Management"
    puts "1. Add a new course"
    puts "2. Delete a course"
    puts "3. Exit"
    answer = gets.chomp.to_i

  case answer
  when 1
    new_course
  when 2
    delete_course
  when 3
  break
  end
  end
end
menu