class Task < ApplicationRecord
  belongs_to :list, touch: true
  acts_as_list scope: :list

  validates :name, presence: true

  delegate :board, to: :list
end
