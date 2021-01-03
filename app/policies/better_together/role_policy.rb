
module BetterTogether
  class RolePolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
