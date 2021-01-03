
module BetterTogether
  module Api
    class ResourceController < ApiController
      def index
        query = resource_query_class.new(
          collection: resource_policy_scope,
          filters: query_filters,
          page: query_page,
          sort: query_sort,
        )

        @resources = query.resolve

        render jsonapi: @resources,
               meta: { total: query.total }
      end

      # GET /api/v1/communities/:id
      def show
        @resource = resource_class.find(params[:id])
        authorize @resource

        render jsonapi: @resource
      end

      # POST /api/v1/communities
      def create
        authorize resource_class
        @resource = resource_class.create!(resource_params)

        render jsonapi: @resource
      end

      # PUT /api/v1/communities/:id
      def update
        @resource = resource_class.find(params[:id])
        authorize @resource
        @resource.update!(resource_params)

        render jsonapi: @resource
      end

      # DELETE /api/v1/communities/:id
      def destroy
        @resource = resource_class.find(params[:id])
        authorize @resource
        @resource.destroy

        head :no_content
      end

      protected

      def resource_params
        raise ::NoMethodError, 'you must define the resource_params'
      end

      def jsonapi_class
        {
        }
      end

      def resource_class
        ApplicationRecord
      end

      def resource_query_class
        "#{resource_class}Query".constantize
      end

      def resource_policy_scope
        policy_scope(resource_class)
      end
    end
  end
end
