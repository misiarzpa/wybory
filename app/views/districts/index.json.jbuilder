json.array!(@districts) do |district|
  json.extract! district, :id, :name, :valid_votes, :voters, :user_id
  json.url district_url(district, format: :json)
end
