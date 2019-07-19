class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select {|boating_test| boating_test.instructor == self}
    end

    def pass_student(student, boating_test_name)
        this_boating_test = BoatingTest.all.find {|boating_test| boating_test.name == boating_test_name && boating_test.student == student}

        if this_boating_test
            this_boating_test.status = "passed"
        else
            this_boating_test = BoatingTest.new(student, boating_test_name, "passed", self)
        end

        this_boating_test
    end

    def fail_student(student, boating_test_name)
        this_boating_test = BoatingTest.all.find {|boating_test| boating_test.name == boating_test_name && boating_test.student == student}

        if this_boating_test
            this_boating_test.status = "failed"
        else
            this_boating_test = BoatingTest.new(student, boating_test_name, "failed", self)
        end

        this_boating_test
    end

end