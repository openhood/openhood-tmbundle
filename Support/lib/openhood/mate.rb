# This is based on the official RSpec tm-bundle
require "#{ENV['TM_SUPPORT_PATH']}/lib/textmate"
require 'rubygems'

ENV['TM_PROJECT_DIRECTORY'] ||= File.dirname(ENV['TM_FILEPATH'])

def gemfile?
  File.exist?(File.join(ENV['TM_PROJECT_DIRECTORY'], 'Gemfile'))
end

begin
  require "bundler/setup" if gemfile?
  require "active_support/core_ext/string"
rescue Exception => e
  TextMate.exit_show_tool_tip "Error: ActiveSupport not found (using #{gemfile? ? "bundler with current Gemfile" : "rubygems"})"
end