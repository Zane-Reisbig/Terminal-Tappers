class Stage
  attr_reader :gamestage
  def initialize()
    @gamestage = 1
  end

  def StageUp()
    @gamestage += 1
  end

end
