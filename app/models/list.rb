class List < ApplicationRecord
  belongs_to :board, touch: true
  acts_as_list scope: :board

  has_many :tasks

  validates :name, presence: true
end
