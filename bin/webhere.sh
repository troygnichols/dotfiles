#!/usr/bin/env ruby

require 'webrick'
include WEBrick

port = ARGV[0] || 4000

s = HTTPServer.new(:Port => port, :DocumentRoot => Dir::pwd)
trap "INT" do s.shutdown end
s.start
