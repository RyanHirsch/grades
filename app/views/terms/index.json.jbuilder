json.array!(@terms) do |term|
  json.extract! term, :name, :start, :end
  json.url term_url(term, format: :json)
end
