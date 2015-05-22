gem "haml-rails"
gem "bootstrap-sass"
gem "pry-rails"
gem "pry-byebug"
gem "puma"
gem "redcarpet"

gem_group :test do
  gem "minitest-rails"
end

environment "config.sass.preferred_syntax = :sass"

run "rm README.rdoc"
