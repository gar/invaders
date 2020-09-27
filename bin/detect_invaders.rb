#!/usr/bin/env ruby

require_relative '../lib/invaders'

radar_filename = File.join(File.dirname(__FILE__), '../examples/radar.txt')
invader1_filename = File.join(File.dirname(__FILE__), '../examples/invader1.txt')
invader2_filename = File.join(File.dirname(__FILE__), '../examples/invader2.txt')

Invaders::CLI.new(radar_filename, invader1_filename, invader2_filename).run
