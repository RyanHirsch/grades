json.array!(@sections) do |section|
  json.extract! section, :name, :term_id, :course_id
  json.url section_url(section, format: :json)
end
