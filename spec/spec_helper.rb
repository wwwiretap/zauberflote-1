require_relative '../lib/zauberflote'

require 'minitest/autorun'
require 'turn'

Turn.config do |c|
  c.format = :outline
  c.trace = true
  c.natural = true
end
