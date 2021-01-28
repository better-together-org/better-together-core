# frozen_string_literal: true

module BetterTogether
  # Represents a class that has control over the actions of other classes.
  # Meant to be used with user login classes
  module Agent
    extend ActiveSupport::Concern

    included do
      has_one :person_identification,
            -> {
              where(
                identity_type: 'BetterTogether::Person',
                active: true
              )
            },
            as: :agent,
            class_name: 'BetterTogether::Identification',
            autosave: true
      has_one :person,
            through: :person_identification,
            source: :identity,
            source_type: 'BetterTogether::Person'

      accepts_nested_attributes_for :person

      def build_person(attributes)
        self.build_person_identification(
          agent: self,
          identity: BetterTogether::Person.new(attributes)
        )
      end
    end
  end
end
