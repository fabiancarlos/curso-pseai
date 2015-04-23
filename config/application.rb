require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SitePseai
  class Application < Rails::Application
    config.time_zone = 'Brasilia'
    
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = ["pt-BR", "en"]
    config.i18n.default_locale = 'pt-BR'

    config.generators do |g|
      g.javascript_engine :js
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  :rspec, :fixture => false
      g.view_specs      false
      g.helper_specs    false
      g.fixture_replacement :factory_girl
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
