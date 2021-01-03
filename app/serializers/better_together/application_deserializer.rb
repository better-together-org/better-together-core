
module BetterTogether
  # Base JSONAPI deserializer that deserializes common attrbutes
  class ApplicationDeserializer < ::JSONAPI::Deserializable::Resource
    attribute :bt_id
  end
end
