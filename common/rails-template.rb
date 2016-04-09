gem 'haml-rails'
gem 'hamlit'
gem 'bootstrap-sass'
gem 'pry-rails'
gem 'pry-byebug'
gem 'puma'
gem 'redcarpet'
gem 'font-awesome-sass'

gem_group :development do
  gem 'better_errors'
  gem 'quiet_assets'
  gem 'erb2haml'
  gem 'binding_of_caller'
end

gem_group :test do
  gem 'minitest-utils'
  gem 'database_cleaner'
end

gem_group :development, :test do
  gem 'letter_opener'
  gem 'dotenv-rails'
end

environment 'config.sass.preferred_syntax = :sass'

run 'rm README.md'

after_bundle do
  run 'rake haml:replace_erbs'
  file 'app/assets/stylesheets/scaffolds.sass', bootstrap
  git :init
  git add: '.'
  git commit: %Q{ -m 'Init.' }
end

def bootstrap
  <<-EOF
@import 'bootstrap-sprockets'
@import 'bootstrap'
@import 'font-awesome-sprockets'
@import 'font-awesome'
EOF
end
