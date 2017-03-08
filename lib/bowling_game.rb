class BowlingGame

  FRAMES_NUM = 10

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    frameIndex = 0
    score = 0

    FRAMES_NUM.times do
      if strike?(frameIndex)
        score += 10 + strike_bonus(frameIndex)
        frameIndex += 1
      elsif spare?(frameIndex)
        score += 10 + spare_bonus(frameIndex)
        frameIndex += 2
      else
        score += sum_of_balls_in_frame(frameIndex)
        frameIndex += 2
      end
    end
    score
  end

  private

  def sum_of_balls_in_frame(frameIndex)
    @rolls[frameIndex] + @rolls[frameIndex+1]
  end

  def spare_bonus(frameIndex)
    @rolls[frameIndex + 2]
  end

  def strike_bonus(frameIndex)
    @rolls[frameIndex+1] + @rolls[frameIndex+2]
  end

  def strike?(frameIndex)
    @rolls[frameIndex].eql?(10)
  end

  def spare?(frameIndex)
    (@rolls[frameIndex] + @rolls[frameIndex+1]).eql?(10)
  end
end
