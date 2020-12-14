class List < ApplicationRecord
  belongs_to :board
  acts_as_list scope: :board

  has_many :tasks
end
