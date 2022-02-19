module GroupSubjects
  # ...
  class GroupSubjectsService
    attr_reader :result

    def initialize
      @result = OpenStruct.new(success?: false, group_subject: GroupSubject.new)
    end

    def list
      GroupSubject.all
    end

    def new
      result
    end

    def create(params)
      result.tap do |r|
        r.group_subject = GroupSubject.new(params)
        r.send('success?=', r.group_subject.save)
      end
    end

    def edit(id)
      find_record(id)
    end

    def update(id, params)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.group_subject.update(params))
      end
    end

    def delete(id)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.group_subject.destroy)
      end
    end

    private

    def find_record(id)
      result.group_subject = GroupSubject.find(id)
      result
    end
  end
end
