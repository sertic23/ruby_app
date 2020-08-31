### ruby_app
ruby_app is parser for webserver traffic written in ruby.
It receives log with pages and ip adresses as argument and
calculates page loads and unique page visits.

### Usage
- clone the repo
- navigate to scripts folder
- start script with by passing log
> ruby parser.rb webserver.log

### Tests
- position to root directory
- install rspec gem by running
> bundle install
- run individual tests with rspec command
> bundle exec rspec spec_name
- run all tests with command
> bundle exec rspec spec

### Requirements
- ruby
- bundler
- rspec gem

