require_dependency "better_together/api/resource_controller"

module BetterTogether
  module Api
    module V1   
      class PeopleController < ResourceController
        # GET /api/v1/people/me
        def me
          authorize resource_class
          @person = current_user.person
          raise ActiveRecord::RecordNotFound if @person.nil?

          render jsonapi: @person
        end

        protected

        def resource_params
          params.require(:person).permit(
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
          ::BetterTogether::CommunityMembership
        end

        private

        def person_params
          params.require(:person).permit(
            :name, :description
          )
        end

        def jsonapi_class
          {
            Person: Api::V1::SerializablePerson
          }
        end

        def resource_class
          ::BetterTogether::Person
        end
      end
    end
  end
end
