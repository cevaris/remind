json.array!(@reminders) do |reminder|
  json.extract! reminder, :id, :name, :comments, :completed, :notify_datetime
  json.url reminder_url(reminder, format: :json)
end
