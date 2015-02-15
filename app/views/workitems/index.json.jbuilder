json.array!(@workitems) do |workitem|
  json.extract! workitem, :id
  json.url workitem_url(workitem, format: :json)
end
