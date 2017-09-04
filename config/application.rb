require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PetsHome
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.template_engine     :haml
      g.test_fraemwork      :rspec, fixtures: true, views: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

  config.i18n.available_locales = %w(ru en)

  end
end
