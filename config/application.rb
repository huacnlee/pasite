# encoding: utf-8
require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Pasite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{RAILS_ROOT}/extras )
    #config.load_paths += %W( #{RAILS_ROOT}/app/sweepers )
    config.autoload_paths += %W(#{config.root}/lib)

    # Only load the plugins named here, in the order given (default is alphabetical).
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

    # Skip frameworks you're not going to use. To use Rails without a database,
    # you must remove the Active Record framework.
    # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    config.active_record.observers = :comment_observer

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    config.time_zone = 'UTC'

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names.
    config.time_zone = 'Beijing'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    #config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'zh-CN'

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable the asset pipeline
    config.assets.enabled = true

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'
  end
end

I18n.locale = 'zh-CN'


# snippets upload temp file dir
SNIPPET_UPLOAD_TEMP_DIR = '/tmp/cache/pasite/upload/'

Time::DATE_FORMATS[:short_date_string] = "%y年%m月%d日"
Time::DATE_FORMATS[:short_date] = "%y-%m-%d"
Time::DATE_FORMATS[:short_time_string] = "%y年%m月%d日 %H:%M"
Time::DATE_FORMATS[:short_time] = "%y-%m-%d %H:%M"

# App domain
APP_HOST = 'pasite.org'
APP_DOMAIN  = "http://#{APP_HOST}"

# custom configs
APP_VERSION = '0.3'

APP_THEMES_NAMES = ['Active4D','Cobalt','Dawn','Mac Classic','LAZY','IDLE','BlackBoard','Twilight',
	'Sunburst','SpaceCadet']
APP_THEMES = ['active4d','cobalt','dawn','mac_classic','lazy','idle','black_board','twilight',
	'sunburst','space_cadet']



# 验证码加密特殊符号
CAPTCHA_SALT = "8998Lj1**&@"
