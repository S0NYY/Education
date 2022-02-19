module Subjects
  # ...
  class SubjectsService
    attr_reader :result

    def initialize
      @result = OpenStruct.new(success?: false, subject: Subject.new)
    end

    def list
      Subject.all
    end

    def new
      result
    end

    def create(params)
      result.tap do |r|
        r.subject = Subject.new(params)
        r.send('success?=', r.subject.save)
      end
    end

    def edit(id)
      find_record(id)
    end

    def update(id, params)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.subject.update(params))
      end
    end

    def delete(id)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.subject.destroy)
      end
    end

    private

    def find_record(id)
      result.subject = Subject.find(id)
      result
    end
  end
end
