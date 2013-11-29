require_relative '../lib/ai'

class DiagonalMove < Ai
  def tick
    turn 10 if heading < 100
    accelerate
    puts heading
  end
end
