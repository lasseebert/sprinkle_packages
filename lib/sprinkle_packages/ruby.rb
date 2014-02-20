package :ruby do
  ruby_version = opts[:ruby_version] || ""
  requires :ruby_dependencies
  requires :install_ruby, ruby_version: ruby_version
  requires :bundler
end

package :ruby_dependencies do
  libs = %w[libffi-dev libssl-dev zlib1g-dev libreadline-dev build-essential]
  apt libs
  verify { libs.each { |lib| has_apt lib } }
end

package :install_ruby do
  description 'Install ruby'
  ruby_version = opts[:ruby_version] || ""

  minor_version = ruby_version.split('.')[0..1].join('.')
  source "ftp://ftp.fu-berlin.de/unix/languages/ruby/#{minor_version}/ruby-#{ruby_version}.tar.gz"

  verify do
    has_file '/usr/bin/ruby'
    test "\"`/usr/bin/ruby -v | awk \'{print $2}\'`\" = \"#{ruby_version.gsub(/-/, '')}p0\""
  end
end

package :bundler do
  description "Install bundler gem"

  gem 'bundler'

  verify do
    has_gem 'bundler'
  end
end
