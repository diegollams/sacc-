json.array!(@interactions) do |interaction|
  json.extract! interaction, :id, :kind, :observation, :date, :time, :customer_id
  json.url interaction_url(interaction, format: :json)
end
