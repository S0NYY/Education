class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :subject
end
