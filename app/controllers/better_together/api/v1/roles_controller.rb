require_dependency "better_together/api/resource_controller"

module BetterTogether
  module Api
    module V1   
      class RolesController < ResourceController
        protected

        def resource_params
          params.require(:role).permit(
            :name, :description
          )
        end

        def jsonapi_class
          {
            Role: Api::V1::SerializableRole
          }
        end

        def resource_class
          ::BetterTogether::Role
        end
      end
    end
  end
end
