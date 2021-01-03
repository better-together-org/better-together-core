
module Api
  module V1
    # Serializes the User class
    class SerializableUser < ::BetterTogether::ApplicationSerializer
      type 'users'
    end
  end
end