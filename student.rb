class Student
  attr_accessor :id, :name, :birth_date, :email, :phone_number, :course_id, :deleted_at

  def initialize(id, name, birth_date, email, phone_number, course_id)
    @id = id
    @name = name
    @birth_date = birth_date
    @email = email
    @phone_number = phone_number
    @course_id = course_id
    @deleted_at = nil
  end

  @@record = []
  def save
    existing_record = @@record.find { |student| student.id == @id }
    if existing_record
      existing_record.name = @name
      existing_record.birth_date = @birth_date
      existing_record.email = @email
      existing_record.phone_number = @phone_number
      existing_record.course_id = @course_id
      existing_record.deleted_at = @deleted_at
      puts "Student updated successfully!"
    else
      @@record << self
      puts "Student added successfully!"
    end
  end

  def destroy
    @deleted_at = Time.now
  end

  def display
    course_name = Course.find(@course_id)&.name || "No Course Assigned"
    puts "ID: #{@id}, Name: #{@name}, Course: #{course_name}"
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