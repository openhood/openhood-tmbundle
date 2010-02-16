RAILS_ROOT = ENV["TM_PROJECT_DIRECTORY"]
if File.directory?("#{RAILS_ROOT}/vendor/rails/")
  # we have found Rails frozen in vendor, use it from there
  $:.unshift "#{RAILS_ROOT}/vendor/rails/activesupport/lib/"
  require "active_support"
else
  # Rails not found, try to load what we need as gem
  begin
    require "rubygems"
    require "active_support"
  rescue
    TextMate.exit_show_tool_tip "Error: Rails not found either frozen or as gem."
  end
end

require "active_support/core_ext/string"