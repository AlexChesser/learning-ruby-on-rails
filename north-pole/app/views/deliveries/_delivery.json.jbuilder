json.extract! delivery, :id, :manifest, :delivery_date, :customer_id, :assigned_to_id, :destination_id, :is_complete, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)
