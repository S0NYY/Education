module Profiles
  # ...
  class ProfilesService
    attr_reader :result, :current_user

    def initialize(current_user)
      @current_user = current_user
      @result = OpenStruct.new(success?: false, profile: Profile.new)
    end

    def list
      Profile.all
    end

    def profile
      Profile.find_by(user_id: current_user.id)
    end

    def new
      result
    end

    def edit(id)
      find_record(id)
    end

    def create(params)
      result.tap do |r|
        r.profile = Profile.new(params)
        r.send('success?=', r.profile.save)
      end
    end

    def update(id, params)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.profile.update(params))
      end
    end

    def delete(id)
      find_record(id)

      result.tap do |r|
        r.send('success?=', r.profile.destroy)
      end
    end

    private

    def find_record(id)
      result.profile = Profile.find(id)
      result
    end
  end
end
