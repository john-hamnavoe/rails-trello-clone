json.extract! board, :id, :name, :created_at, :updated_at
json.url board_url(board, format: :json)
