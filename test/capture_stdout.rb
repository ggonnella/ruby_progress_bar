# idea from http://stefankst.net/2007/06/05/capture-standard-output-in-ruby/
def capture_stdout
   old_stdout = $stdout
   out = StringIO.new
   $stdout = out
   begin
      yield
   ensure
      $stdout = old_stdout
   end
   out.string
end
alias :discard_stdout :capture_stdout
