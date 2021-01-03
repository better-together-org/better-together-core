# Responsible for returning a collection of items
# Results can be sorted, filtered, and paginated
module BetterTogether
  class PersonQuery < BaseQuery
    def tables_hash
      {
        people: ::Person.arel_table
      }
    end

    def base_collection
      collection || ::Person.all
    end

    def filter_class
      QueryFilters::PersonFilter
    end

    protected

    def sort_by
      tables.people[sort.key]
    end
  end
end
