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

    def boating_test
        BoatingTest.all.select do |test|
            test.instructor == self
        end
    end

    def find_test(student, boating_test_name)
        boating_test.select do |test|
            test.student == student && test.boating_test_name == boating_test_name
        end
    end


    def pass_student(student, boating_test_name)
        # BoatingTest.all.select do |tests|
        #     if tests.student == student & tests.boating_test_name == boating_test_name
        #         tests.boating_test_status = "passed"
        #     else BoatingTest.new(self, boating_test_name, "passed", instructor)
        #     end
        # end
        tests_taken = find_test(student, boating_test_name)
            if tests_taken[0].student == student
                tests_taken[0].boating_test_status = "passed"
            else
                BoatingTest.new(student, boating_test_name, "passed", self)
            end
    end

    def fail_student
        tests_taken = find_test(student, boating_test_name)
            if tests_taken[0].name == student 
                tests_taken[0].boating_test_status = "failed"
            else
                BoatingTest.new(student, boating_test_name, "failed", self)
            end
    end


end
