
module BetterTogether
  module Api
    module V1
      # Deserializes the Community class
      class DeserializableCommunity < ::BetterTogether::ApplicationDeserializer
        attributes :name, :description, :slug, :creator_id

        has_one :creator
      end
    end
  end
end
