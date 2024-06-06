# frozen_string_literal: true

class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]
  before_action :set_board, only: %i[new create]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = @board.lists.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = @board.lists.new(create_list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to board_path(@list.board_id) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("list-form", partial: "form", locals: {list: @list, board: @list.board, cancel_path: board_path(@list.board), data: {turbo_frame: :_top}}), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(update_list_params)
        format.html { redirect_to board_path(@list.board_id) }
      else
        format.html { render :edit }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("list-form", partial: "form", locals: {list: @list, board: @list.board, cancel_path: board_path(@list.board), data: {turbo_frame: :_top}}), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @list = List.find(params[:id])
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  # Only allow a list of trusted parameters through.
  def create_list_params
    params.require(:list).permit(:name, :position)
  end

  def update_list_params
    params.require(:list).permit(:name)
  end
end
