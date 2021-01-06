class List < ApplicationRecord
  belongs_to :board
  acts_as_list scope: :board

  has_many :tasks

  validates :name, presence: true

  after_update_commit -> { broadcast_replace_to self }  
  # broadcasts_to :board
  # after_create_commit -> { broadcast_append_to board }
  # after_destroy_commit -> { broadcast_remove_to board }
  # after_update_commit -> { broadcast_replace_to :board }  
end
