class Lists::PositionController < ApplicationController
  def update
    @list = List.find(params[:list_id])
    new_position = params[:row_position]
    @list.update(position: new_position)
    head :no_content
  end
end
