module BetterTogether
  class Engine < ::Rails::Engine
    isolate_namespace BetterTogether

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, :dir => 'spec/factories'
    end

    config.before_initialize do
      require_dependency 'friendly_id'
      require_dependency 'mobility'
      require_dependency 'friendly_id/mobility'
      require_dependency 'jsonapi/deserializable'
      require_dependency 'jsonapi/rails'
      require_dependency 'pundit'
      require_dependency 'rack/cors'
      require_dependency 'will_paginate'
    end
  end
end
