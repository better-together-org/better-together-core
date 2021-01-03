
module BetterTogether
  module Api
    module V1
      # Serializes the Community class
      class SerializableCommunity < ::BetterTogether::ApplicationSerializer
        type 'communities'

        attributes :name, :description, :slug, :creator_id

        has_one :creator,
                class_name: 'Person'
      end
    end
  end
end
