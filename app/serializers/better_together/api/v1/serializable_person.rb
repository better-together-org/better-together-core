
module BetterTogether
  module Api
    module V1
      # Serializes the Person class
      class SerializablePerson < ::BetterTogether::ApplicationSerializer
        type 'people'

        attributes :name, :description, :slug
      end
    end
  end
end
