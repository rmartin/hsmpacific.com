source 'https://rubygems.org'

gem 'rails', '3.2.21'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.3.0'
gem 'actionmailer', '3.2.21'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Refinery CMS
gem 'refinerycms', '~> 2.1.5'
gem 'acts_as_indexed', '0.8.3'
gem 'psych', '2.0.13'

# Specify additional Refinery CMS Extensions here (all optional):
gem 'refinerycms-authentication', '~> 2.1.5'
gem 'refinerycms-i18n', '~> 2.1.0'
#  gem 'refinerycms-blog', '~> 2.0.0'
#  gem 'refinerycms-inquiries', '~> 2.0.0'
#  gem 'refinerycms-search', '~> 2.0.0'
#  gem 'refinerycms-page-images', '~> 2.0.0'

# The Heroku gem allows you to interface with Heroku's API
gem 'heroku'

# Migrate data locally to production
gem 'taps'

group :production do
  # Postgres support (added for Heroku)
  gem 'pg'
  # Fog allows you to use S3 assets (added for Heroku)
  gem 'fog'
end

# Associate multiple images with a single page.
gem 'refinerycms-page-images', '~> 2.1.1'

gem 'refinerycms-brokers', :path => 'vendor/extensions'
gem 'refinerycms-tenants', :path => 'vendor/extensions'
gem 'refinerycms-properties', :path => 'vendor/extensions'



ruby '2.0.0'
