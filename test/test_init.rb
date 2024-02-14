ENV["TEST_BENCH_DETAIL"] ||= ENV["D"]

puts RUBY_DESCRIPTION

require_relative '../init.rb'
require 'template_method/controls'
Controls = TemplateMethod::Controls

require 'pp'

require 'test_bench'; TestBench.activate
