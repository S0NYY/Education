module Courses
  # ...
  class CoursesService
    attr_reader :result

    def initialize
      @result = OpenStruct.new(success?: false, course: Course.new)
    end

    def list
      Course.all
    end

    def new
      result
    end

    def create(params)
      result.tap do |r|
        r.course = Course.new(params)
        r.send('success?=', r.course.save)
      end
    end

    def edit(id)
      find_record(id)
    end

    def update(id, params)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.course.update(params))
      end
    end

    def delete(id)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.course.destroy)
      end
    end

    private

    def find_record(id)
      result.course = Course.find(id)
      result
    end
  end
end
