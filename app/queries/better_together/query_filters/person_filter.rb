
module BetterTogether
  module QueryFilters
    # Set filters for a PersonQuery instance
    class PersonFilter < BaseFilter
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
          [tables.people[:id].as('CHAR')]
        ).matches("%#{filters.id}%")
        append_condition(filter)
      end

      def set_name
        return if filters.name.blank?

        # allow partial matches on the name
        append_condition(
          tables.people[:name].matches("%#{filters.name}%")
        )
      end

      def set_description
        return if filters.description.blank?

        # allow partial matches on the description
        append_condition(
          tables.people[:description].matches("%#{filters.description}%")
        )
      end
    end
  end
end
