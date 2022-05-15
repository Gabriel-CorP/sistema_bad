json.extract! ubicacion, :id, :nombre, :direccion, :proveedor_id, :created_at, :updated_at
json.url ubicacion_url(ubicacion, format: :json)
