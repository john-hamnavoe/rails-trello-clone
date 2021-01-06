class ListsController < ApplicationController
  include Turbo::Broadcastable
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :set_board, only: [:new, :create]

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
    @list = @board.lists.new(list_params)

    respond_to do |format|
      if @list.save
        format.turbo_stream { broadcast_lists_update }
        format.html { redirect_to board_path(@list.board_id), notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def move_left
    @list = List.find_by(id: params[:list_id])
    @list.position -= 1
    @list.save

    broadcast_lists_update
  end

  def move_right
    @list = List.find_by(id: params[:list_id])
    @list.position += 1
    @list.save
    
    broadcast_lists_update
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
    def list_params
      params.require(:list).permit(:name, :position)
    end

    def broadcast_lists_update
      html = ApplicationController.render partial: "lists/list", collection: @list.board.lists.sort_by(&:position)
      ListsChannel.broadcast_to @list.board, lists: html
    end
end
