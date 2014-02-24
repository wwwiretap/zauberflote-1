require_relative '../lib/zauberflote'

require 'minitest/autorun'
require 'turn'
require 'coveralls'
Coveralls.wear!

Turn.config do |c|
  c.format = :outline
  c.trace = true
  c.natural = true
end
