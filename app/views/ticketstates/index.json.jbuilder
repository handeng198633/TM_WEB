json.array!(@ticketstates) do |ticketstate|
  json.extract! ticketstate, :id, :stateinfo, :start_time
  json.url ticketstate_url(ticketstate, format: :json)
end
