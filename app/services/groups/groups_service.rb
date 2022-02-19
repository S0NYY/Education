module Groups
  # ...
  class GroupsService
    attr_reader :result

    def initialize
      @result = OpenStruct.new(success?: false, group: Group.new)
    end

    def list
      Group.all
    end

    def new
      result
    end

    def create(params)
      result.tap do |r|
        r.group = Group.new(params)
        r.send('success?=', r.group.save)
      end
    end

    def edit(id)
      find_record(id)
    end

    def update(id, params)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.group.update(params))
      end
    end

    def delete(id)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.group.destroy)
      end
    end

    private

    def find_record(id)
      result.group = Group.find(id)
      result
    end
  end
end
