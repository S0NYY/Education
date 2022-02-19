class AddUserToSubjects < ActiveRecord::Migration[6.1]
  def change
    add_reference :subjects, :user, foreign_key: true
  end
end
