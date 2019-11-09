require_relative "GameStage.rb"

class Enemy
  attr_reader :health, :name, :level
  def initialize(level)
    @level = level
    @name = Name()
    @health = Health()
  end

  def Health
    return rand(1..10) * @level
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
