json.array!(@students) do |student|
  json.extract! student, :id, :fname, :lname, :teacher_id, :class_id
  json.url student_url(student, format: :json)
end
