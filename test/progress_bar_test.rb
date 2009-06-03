#!/usr/bin/env ruby
require "../progress_bar.rb"
require "test/unit"
require "capture_stdout.rb"

class ProgressBarTest < Test::Unit::TestCase

  [1, 3, 7, 18, 40, 61, 100, 101, 777, 1000].each do |n|
    define_method "test_#{n}_iterations" do 
      bar = nil
      scala = capture_stdout { bar = ProgressBar.new(n) }
      expected_nof_points = scala.match(/.*?\[(.*?)\].*/)[1].size
      points = capture_stdout { n.times {bar.next} }
      assert_equal expected_nof_points, points.size
    end
  end
  
end
