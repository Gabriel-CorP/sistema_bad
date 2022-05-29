json.extract! requesicion, :id, :created_at, :updated_at
json.url requesicion_url(requesicion, format: :json)
