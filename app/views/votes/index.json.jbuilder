json.array!(@votes) do |vote|
  json.extract! vote, :id, :number, :district_id, :committee_id
  json.url vote_url(vote, format: :json)
end
