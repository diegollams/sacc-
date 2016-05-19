json.array!(@surveys) do |survey|
  json.extract! survey, :id, :name, :customer_id
  json.url survey_url(survey, format: :json)
end
