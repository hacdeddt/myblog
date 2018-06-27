json.extract! comment, :id, :email, :name, :content, :post_id, :parents_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
