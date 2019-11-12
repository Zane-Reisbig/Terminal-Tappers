require_relative "GameStage.rb"

class Enemy
  attr_reader :health, :name, :level
  def initialize(level)
    @level = level
    @name = Name()
    @health_start = 5
    if @level != 1
      @health = ((rand(1..10) * @level.to_i) * 0.5) + @health_start
      if @health / 2 > @level
        until @health / 2 > @level
          @health + 0.5
        end
      end
    else
      @health = 5
    end
  end

  def Health
    x = rand(1..10) * @level
    y = x * 0.05
    @health = @health + y
    puts @health
    return
  end

  def Name
    name = ["Kevin","Richard","Pete"]
    return name[rand(name.length)]
  end

  def Display
    puts "A wild #{@name} appears!"
    puts "It has #{@health} life remaining."
  end

  def Hit(attack)
    @health -= attack
  end
end
