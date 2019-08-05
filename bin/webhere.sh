#!/usr/bin/env ruby

require 'webrick'
include WEBrick

port = ARGV.first || 4000
dir = ARGV.last || Dir::pwd

s = HTTPServer.new(:Port => port, :DocumentRoot => dir)
trap "INT" do s.shutdown end
s.start
