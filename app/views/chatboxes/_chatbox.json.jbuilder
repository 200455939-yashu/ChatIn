json.extract! chatbox, :id, :name, :is_private, :created_at, :updated_at
json.url chatbox_url(chatbox, format: :json)
