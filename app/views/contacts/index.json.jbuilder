json.array!(@contacts) do |contact|
  json.extract! contact, :id, :nome, :email, :telefone, :user_id
  json.url contact_url(contact, format: :json)
end
