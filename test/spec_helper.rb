require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'

# Require_relative your lib files here!
require_relative '../far_mar'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

