class Student
  attr_accessor :student_id, :name, :birth_date, :email, :phone_number

  def initialize(student_id, name, birth_date, email, phone_number)
    @id = student_id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
  end

    @@record = []
  def save
    @@record.prepend(self)
  end
  def destroy
    @@record.delete(self)
  end
  def display
    puts "Student ID: #{@id}, Name: #{@name}, Birth_date: #{@birth_date}, Email: #{@email}, Phone_Number: #{@phone_number}"
  end
  def self.all
    @@record
  end
  def self.find(student_id)
    @@record.find{ |id| id == student_id }
  end
  def self.find_by_email(email)
    @@record.find{|student_email| student_email == email}
  end
end

