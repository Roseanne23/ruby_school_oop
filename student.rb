class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number

  def initialize(id, name, birth_date, email, phone_number)
    @id = id
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
    puts "Student ID: #{self.id}, Name: #{self.name}, Birth_date: #{self.birth_date}, Email: #{self.email}, Phone_Number: #{self.phone_number}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |student| student.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |student| student.email == email }
  end
end