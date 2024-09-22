class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :deleted_at

  def initialize(id, name, birth_date, email, phone_number, deleted_at = nil)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @deleted_at = deleted_at
  end

  @@record = []
  def save
    @@record.prepend(self)
  end

  def destroy
    @@deleted_at = Time.now
  end

  def display
    puts "Student ID: #{self.id}, Name: #{self.name}, Birth_date: #{self.birth_date}, Email: #{self.email}, Phone_Number: #{self.phone_number}"
  end

  def self.all
    @@record.select { |student| student.deleted_at.nil? }
  end

  def self.find(id)
    @@record.find { |student| student.id == id }
  end

  def self.find_by_email(email)
    @@record.find { |student| student.email == email }
  end
end