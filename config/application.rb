require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ControlledProfits
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.api_only = true

    config.action_dispatch.default_headers = {
      'Access-Control-Allow-Origin' => '*',
      'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(","),
      'Access-Control-Expose-Headers' => '%w{access-token client token-type uid'}.join(",")
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
