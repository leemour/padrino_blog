source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'sass'
gem 'haml'
gem 'activerecord', '>= 3.1', :require => 'active_record'

group :development, :test do 
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Test requirements
group :test do
  gem 'shoulda'
  gem 'rack-test', :require => 'rack/test'
end

group :assets do
  gem 'therubyracer'
end

# Padrino Stable Gem
gem 'padrino', '0.11.0'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.11.0'
# end
