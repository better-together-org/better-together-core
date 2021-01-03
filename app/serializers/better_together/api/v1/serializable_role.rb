
module BetterTogether
  module Api
    module V1
      # Serializes the Role class
      class SerializableRole < ::BetterTogether::ApplicationSerializer
        type 'roles'

        attributes :name, :description, :sort_order, :reserved
      end
    end
  end
end
