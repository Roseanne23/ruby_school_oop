class CourseSubject
  attr_accessor :id, :course_id, :subject_id

  def initialize(id, course_id, subject_id)
    @id = id
    @course_id = course_id
    @subject_id = subject_id
  end

  @@record = []
  def save
  existing_record = @@record.find { |record| record.id == @id }

  if existing_record
    existing_record.course_id = @course_id
    existing_record.subject_id = @subject_id
    puts "Course Subject updated successfully!"
  else
    @@record << self
    puts "Course Subject added successfully!"
  end
  end

  def destroy
    @@record.delete(self)
    puts "Course Subject deleted."
  end

  def display
    "ID: #{@id}, Course ID: #{@course_id}, Subject ID: #{@subject_id}"
  end

  def self.all
    @@record
  end

  def self.find(id)
    @@record.find { |record| record.id == id }
  end

  def self.find_by_course_id(course_id)
    @@record.select { |record| record.course_id == course_id }
  end

  def subject
    Subject.find(@subject_id)
  end

  def name
    subject.name
  end
end