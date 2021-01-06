class Board < ApplicationRecord
  has_many :lists

  validates :name, presence: true, uniqueness: true

  broadcasts
  # after_create_commit -> { broadcast_append_to self }
  # after_destroy_commit -> { broadcast_remove_to self }
  # after_update_commit -> { broadcast_replace_to self }
end
