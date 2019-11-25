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

    def self.find_student(student_name)
        @@all.find do |student|
            student.first_name == student_name
        end
    end

    def student_tests_taken
        BoatingTest.all.select do |test|
            test.student.first_name == self.first_name
        end
    end

    def total_tests
        student_tests_taken.length.to_f
    end

    def total_passed
        student_tests_taken.select do |test|
            test.boating_test_status == "passed"
        end
    end

    def num_tests_passed
        total_passed.length.to_f
    end

    def grade_percentage
        (num_tests_passed / total_tests)*100
    end


end
