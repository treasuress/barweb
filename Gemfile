source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'activeadmin'
gem 'paperclip'
gem 'rack-p3p'
#gem 'fancybox-rails'
#gem 'fancybox-rails', :git => 'https://github.com/sverigemeny/fancybox-rails'

#todo futuro - seria bom mudar pra versao atual, mas n conseguih fazer funcionar direito (se for usar algum dia)
gem 'ckeditor', '3.7.1'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.3.0'
gem 'nokogiri', '1.6.0'

group :test, :development do
  gem 'turn', '~> 0.8.3', :require => false
  gem 'rspec-rails', "~> 2.13.1"
  gem 'capybara', '2.0.0'
  gem 'launchy'
  gem 'database_cleaner'
end

group :deploy do
  gem 'capistrano'
  gem 'rvm-capistrano'
end

group :production do
  gem 'unicorn'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# To use debugger
# gem 'debugger'
