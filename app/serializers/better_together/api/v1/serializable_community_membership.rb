
module BetterTogether
  module Api
    module V1
      # Serializes the CommunityMembership class
      class SerializableCommunityMembership < ::BetterTogether::ApplicationSerializer
        type 'community_memberships'

        has_one :member,
                class_name: 'Person'
        has_one :community
        has_one :role
      end
    end
  end
end
