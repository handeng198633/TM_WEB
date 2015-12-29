json.array!(@planestates) do |planestate|
  json.extract! planestate, :id, :stateinfo, :start_time
  json.url planestate_url(planestate, format: :json)
end
