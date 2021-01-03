require_dependency "better_together/api/resource_controller"

module BetterTogether
  module Api
    module V1   
      class CommunityMembershipsController < ResourceController
        protected

        def resource_params
          params.require(:community_membership).permit(
            :community_id, :person_id
          )
        end

        def jsonapi_class
          {
            Community: Api::V1::SerializableCommunity,
            CommunityMembership: Api::V1::SerializableCommunityMembership,
            Person: Api::V1::SerializablePerson
          }
        end

        def resource_class
          ::BetterTogether::CommunityMembership
        end
      end
    end
  end
end
