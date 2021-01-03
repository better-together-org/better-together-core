
module BetterTogether
  # Responsible for returning a collection of items
  # Results can be sorted, filtered, and paginated
  class CommunityQuery < BaseQuery
    def tables_hash
      {
        communities: Community.arel_table
      }
    end

    def base_collection
      collection || Community.all
    end

    def filter_class
      QueryFilters::CommunityFilter
    end

    protected

    def sort_by
      tables.communities[sort.key]
    end
  end
end
