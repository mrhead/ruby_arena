#!/usr/bin/env ruby

require_relative '../lib/option_parser'
require_relative '../lib/game'

options = OptionParser.parse(ARGV)

Game.new({ options: options, robot_files: ARGV }).run
