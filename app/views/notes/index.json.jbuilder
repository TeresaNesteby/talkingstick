json.array!(@notes) do |note|
  json.extract! note, :id, :title, :user_id, :student_id, :class_id, :description, :positive
  json.url note_url(note, format: :json)
end
