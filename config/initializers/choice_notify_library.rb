case RUBY_PLATFORM
when /linux/
  require 'rb-inotify'
  FSEvent = INotify::Notifier
when /darwin/
  require 'rb-fsevent'
end
