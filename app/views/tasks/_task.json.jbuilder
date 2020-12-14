json.extract! task, :id, :name, :list_id, :position, :created_at, :updated_at
json.url task_url(task, format: :json)
