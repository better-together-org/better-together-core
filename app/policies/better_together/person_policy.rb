
module BetterTogether
  class PersonPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
