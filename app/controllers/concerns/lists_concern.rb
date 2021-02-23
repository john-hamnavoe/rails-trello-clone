# frozen_string_literal: true

module ListsConcern
  extend ActiveSupport::Concern
  
  def broadcast_lists_update
    html = ApplicationController.render partial: "lists/list", collection: @task.list.board.lists.sort_by(&:position)
    ListsChannel.broadcast_to @task.list.board, lists: html
  end
end
