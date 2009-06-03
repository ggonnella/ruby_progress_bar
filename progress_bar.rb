class ProgressBar

  def initialize(total)
    @time = Time.now
    @total = total
    @completed = 0
    @parts = 0 # total parts is 50, the space between [ and ]
    puts "[0%--------25%---------50%---------75%---------100%]"
    print "["
    $stdout.flush
  end
  
  def next
    @completed += 1
    parts = (@completed*50/@total)  
    diff = parts - @parts
    if diff > 0
      @parts = parts
      print '.'*diff
      $stdout.flush
    end
  end
  
  def close
    puts "] (%.2fs)" % (Time.now-@time)
    $stdout.flush
  end

end
