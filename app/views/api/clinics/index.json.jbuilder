json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :title, :survey, :guid, :address, :address2, :city, :state, :zip, :phone, :created_at, :updated_at
end