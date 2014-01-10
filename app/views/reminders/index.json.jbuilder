json.array!(@reminders) do |reminder|
  json.extract! reminder, :id, :name, :comments, :completed, :notify_datetime, :prefered_contact
  json.url reminder_url(reminder, format: :json)
end
