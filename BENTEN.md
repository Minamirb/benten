
# How to create Rails 4 application
## Generate Rails 4 application
Bundler version >= 1.2.2 required.

    rvm use ruby-1.9.3-p286
    rvm gemset create benten
    rvm gemset use benten
    gem install rails
    rails new benten --edge
    gem install bundler

## Fix Gemfile to work
    vi Gemfile

### Gemfile diff
    -gem 'rails',     :git => 'git://github.com/rails/rails.git', :branch => '3-2-stable'
    -gem 'journey',   :git => 'git://github.com/rails/journey.git'
    -gem 'arel',      :git => 'git://github.com/rails/arel.git', :branch => '3-0-stable'

    +gem 'rails',     github: 'rails/rails'
    +gem 'journey',   github: 'rails/journey'
    +gem 'arel',      github: 'rails/arel'
    +gem 'activerecord-deprecated_finders', github: 'rails/activerecord-deprecated_finders'
     
    -  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git', :branch => '3-2-stable'
    -  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git', :branch => '3-2-stable'

    +  gem 'sass-rails',   github: 'rails/sass-rails'
    +  gem 'coffee-rails', github: 'rails/coffee-rails'

### Install rubygems
Edit Gemfile following

    bundle

### Install twitter-bootstrap-rails
Uncomment and add following lines in Gemfile

    gem 'therubyracer', platforms: :ruby
    gem "less-rails",              github: 'metaskills/less-rails'
    gem "twitter-bootstrap-rails", github: 'seyhunak/twitter-bootstrap-rails'

    rails generate bootstrap:install
    rails generate bootstrap:layout application ﬂuid

### Install slim-rails
Main repository doesn't support Rails 4, so use fork version.

Add following line into Gemfile then just bundle.

    gem "slim-rails", github: 'alindeman/slim-rails', branch: 'rails4'
