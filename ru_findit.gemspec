# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'bundler/version'

Gem::Specification.new do |s|
  s.name        = "ru_findit"
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Fred Katona"]
  s.email       = ["f.katona@comcast.net"]
  s.homepage    = "http://github.com/bigkat73/ru-findit"
  s.summary     = "Implementation of full text search engine."
  s.description = "Experimental - All Ruby implementation of full text search engine. Most full-text search engines are really heavy duty. The goal of this is to write a simple one that can run quickly for light tasks involving full text search. Ideally, you might want to use this inside of a text mining project if the rest of the project is in ruby."
  s.required_rubygems_version = ">= 1.3.6"

  s.files        = Dir.glob("{lib}/**/*") + %w(README.md)
  s.require_path = 'lib'
  s.add_dependency 'activesupport'
  s.add_development_dependency 'pry'
end