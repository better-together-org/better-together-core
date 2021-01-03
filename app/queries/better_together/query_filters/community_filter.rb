
module BetterTogether
  module QueryFilters
    # Set filters for a CommunityQuery instance
    class CommunityFilter < BaseFilter
      protected

      def set_filters
        set_id
        set_name
        set_description
      end

      def set_id
        return if filters.id.blank?

        # Cast the id column as text to enable a partial match
        filter = Arel::Nodes::NamedFunction.new(
          'CAST',
          [tables.communities[:id].as('CHAR')]
        ).matches("%#{filters.id}%")
        append_condition(filter)
      end

      def set_name
        return if filters.name.blank?

        # allow partial matches on the account name
        append_condition(
          tables.communities[:name].matches("%#{filters.name}%")
        )
      end

      def set_description
        return if filters.description.blank?

        # allow partial matches on the account description
        append_condition(
          tables.communities[:description].matches("%#{filters.description}%")
        )
      end
    end
  end
end
