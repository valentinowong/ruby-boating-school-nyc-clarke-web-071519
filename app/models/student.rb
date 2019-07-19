class Student

    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_boating_test(boating_test_name, boating_test_status, instructor)
        BoatingTest.new(self, boating_test_name, boating_test_status, instructor)
    end

    def self.find_student(first_name)
        Student.all.find {|student| student.first_name == first_name}
    end

    def boating_tests
        BoatingTest.all.select {|boating_test| boating_test.student == self}
    end

    def grade_percentage
        passed_boating_tests = boating_tests.select {|boating_test| boating_test.status == "passed"}
        (passed_boating_tests.length*100 / boating_tests.length).to_f
    end

end

# Student#add_boating_test should initialize a new boating test with a Student (Object), a boating test name (String), a boating test status (String), and an Instructor (Object)