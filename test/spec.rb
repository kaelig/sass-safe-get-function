#!/usr/bin/env ruby
# Encoding: utf-8

require_relative 'test-framework'
require 'fileutils'

describe "Compiling files with syntax errors" do
  stdout, stderr, status = Open3.capture3 "node-sass test/wrong-param-type.scss test/wrong-param-type.css"
  puts "Running node_modules/node-sass test/wrong-param-type.scss test/wrong-param-type.css"

  it "should fail to compile if the parameter is not a string" do
    not status.success? and
    not File.exist? 'test/wrong-param-type.css'
  end

  it "should throw a useful error message" do
    find "The parameter passed to safe-get-function() must be a String.", stderr
  end
end

describe "Calling safe-get-function()" do
  it "should output the contents" do
    find "h1{content:\"bar\"}"
  end
  it "should output the same thing in Sass 3.5.0 and LibSass 3.8.x" do
    File.read('test/output-ruby-sass.css').strip! === $output.strip!
  end
end

