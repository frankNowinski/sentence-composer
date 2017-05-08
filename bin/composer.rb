#!/usr/bin/env ruby

require_relative '../config/environment'

if ARGV[0].nil?
  puts 'Enter a string as an argument to receive all possible sentence variations.'
else
  Composer.new(ARGV[0]).compose_sentences
end

