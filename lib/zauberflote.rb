require 'highrise'

Dir[File.dirname(__FILE__) + '/zauberflote/*.rb'].each do |file|
  require file
end

module Zauberflote
  extend Config
end

