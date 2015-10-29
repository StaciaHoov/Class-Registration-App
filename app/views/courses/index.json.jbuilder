json.array!(@courses) do |course|
  json.extract! course, :id, :user, :id, :integer,, :title, :string,, :description, :string,, :time_block, :time,, :age_group, :string,, :max_students, :integer,, :fee, :integer,, :session, :date
  json.url course_url(course, format: :json)
end
