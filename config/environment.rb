# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )
  config.load_paths += %W( #{RAILS_ROOT}/app/sweepers )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"
  config.gem "systemu"
  config.gem "uuidtools"
  # config.gem "rmagick"	

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
  config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :zh_cn

	
end

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
APP_VERSION = '0.1.7'

APP_THEMES_NAMES = ['Active4D','Cobalt','Dawn','Mac Classic','LAZY','IDLE','BlackBoard','Twilight',
	'Sunburst','SpaceCadet']
APP_THEMES = ['active4d','cobalt','dawn','mac_classic','lazy','idle','black_board','twilight',
	'sunburst','space_cadet']
require 'will_paginate'

ActionMailer::Base.default_content_type = "text/html"
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_charset = "utf-8"
ActionMailer::Base.default_url_options[:host] = "http://pasite.org"
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :enable_starttls_auto => true,
  :port => 587,
  :domain => "pasite.org",
  :authentication => :plain,
  :user_name => "support@pasite.org",
  :password => "SU_123123"
}

ExceptionNotifier.exception_recipients = %w(huacnlee@gmail.com)

# 验证码加密特殊符号
CAPTCHA_SALT = "8998Lj1**&@"
