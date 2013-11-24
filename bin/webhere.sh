#!/usr/bin/env ruby

require 'webrick'
include WEBrick

s = HTTPServer.new(:Port => 4000, :DocumentRoot => Dir::pwd)
trap "INT" do s.shutdown end
s.start
