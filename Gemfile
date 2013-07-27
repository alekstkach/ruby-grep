source "http://rubygems.org"
# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end


group :development do
  gem "rdoc"
  gem "bundler"
  gem "jeweler"
  gem "rspec"
end

gem "colorize"

group :development, :test do
  gem "debugger"
end
