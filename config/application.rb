require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SeichiSearch
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.i18n.default_locale = :ja #日本語化

    config.paths.add 'lib', eager_load: true # vision API
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # rails g controller ~~~ などのコマンドでrspec用のテストファイルを作成するための追記。色々な記述があるので、一番下に追記する

    config.generators do |g|
      g.test_framework :rspec,
                  fixtures: true,
                  view_specs: false,
                  helper_specs: false,
                  routing_specs: false,
                  controller_specs: true,
                  request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end