require_dependency "better_together/api/resource_controller"

module BetterTogether
  module Api
    module V1   
      class CommunitiesController < ResourceController
        deserializable_resource :community, 
                              class: DeserializableCommunity,
                              only: %i[create update]
        protected

        def resource_params
          byebug
          params.require(:community).permit(
            :name, :description
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
          ::BetterTogether::Community
        end
      end
    end
  end
end
