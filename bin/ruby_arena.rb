#!/usr/bin/env ruby

require 'ruby_arena'

options = OptionParser.parse(ARGV)

Game.new({ options: options, robot_files: ARGV }).run
