class Player
  attr_reader :attackPower, :xp, :xpHave, :skillPoints
  def initialize(name)
    @name = name
    @xp = 1
    @xpHave = 0
    @level = 1
    @attackPower = 1
    @skillPoints = 0
  end

  def Level(gained)
    @xpHave += gained
    if @xpHave >= @xp
      @level += 1
      @skillPoints +=1
      puts
      puts "You leveled up!"
      puts
      @xp *= rand(1..5)
    end
  end

  def AttackUp(amount)
    @attackPower += amount
  end

  def ShopBuy(amount)
    @skillPoints -= amount
  end

end
