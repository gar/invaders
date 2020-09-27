module Invaders
  class DetectionReport
    def initialize(results, out: STDOUT)
      @out = out
    end

    def print_report
      @out.puts "Detecin' me sum o' dem dar aliens!"
    end
  end
end
