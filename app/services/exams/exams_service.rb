module Exams
  # ...
  class ExamsService
    attr_reader :result

    def initialize
      @result = OpenStruct.new(success?: false, exam: Exam.new)
    end

    def list
      Exam.all
    end

    def new
      result
    end

    def create(params)
      result.tap do |r|
        r.exam = Exam.new(params)
        r.send('success?=', r.exam.save)
      end
    end

    def edit(id)
      find_record(id)
    end

    def update(id, params)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.exam.update(params))
      end
    end

    def delete(id)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.exam.destroy)
      end
    end

    private

    def find_record(id)
      result.exam = Exam.find(id)
      result
    end
  end
end
