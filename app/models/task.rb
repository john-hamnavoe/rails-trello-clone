class Task < ApplicationRecord
  belongs_to :list
  acts_as_list scope: :list
end
