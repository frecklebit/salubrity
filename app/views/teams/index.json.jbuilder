json.array!(@teams) do |team|
  json.extract! team, :id, :name, :subdomain, :website, :logo
  json.url team_url(team, format: :json)
end
