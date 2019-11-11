require_relative "Enemies.rb"
require_relative "GameStage.rb"
require_relative "Player.rb"



def Menu

  level = Stage.new
  monsterDefeated = 0

  puts "To start your adventure, please enter your name."
  print "Champion: "
  name = gets().chomp

  player = Player.new(name)

  puts """
  Welcome to Terminal Tappers!

  Push the space bar to attack

  Press enter to continue...
  """
  gets()

  Game(player,level,monsterDefeated)
end

def Game(player,level,monsterDefeated)

  attacker = Enemy.new(level.gamestage)

  loop do
    puts

    monsterDefeated = StageIncrease(player,monsterDefeated,level)

    if attacker.health <= 0
      monsterDefeated += 1
      puts "#{attacker.name} has been defeated!"
      break
    end
    attacker.Display
    system("stty raw -echo") #=> Raw mode, no echo
    char = STDIN.getc
    system("stty -raw echo") #=> Reset terminal mode
    if char == " "
      attacker.Hit(player.attackPower)
      player.Level(rand(1..5))
    end

    if char == "d"
      puts player.attackPower
    end
    if char == "x"
      puts player.xp
    end
    if char == "e"
      puts player.xpHave
    end
  end
Game(player,level,monsterDefeated)
end

def Interp(choice,player)

  if choice.upcase == "Y"
    Shop(player)
  else
    return
  end

end

def Shop(player)

  puts "Welcome to the shop, type 'EXIT' to leave!"
  puts "1: +1 Attack Damage - 1 skill point"
  puts "2: +2 Attack Damage - 2 skill points"
  choice = ""
  puts "YOU HAVE #{player.skillPoints} REMAINING"
  print "What to buy: "
  choice = gets.chomp
  if choice == "1"
    if player.skillPoints < 1
      print "You cant afford that silly \n"
    else
      player.AttackUp(1)
      player.ShopBuy(1)
    end
  elsif choice == "2"
    if player.skillPoints < 2
      print "You cant afford that silly \n"
    else
      player.AttackUp(2)
      player.ShopBuy(2)
    end
  elsif choice.upcase == "EXIT"
    return
  end
  Shop(player)
end

def StageIncrease(player, monsterDefeated,level)

  if monsterDefeated == 5
    level.StageUp
    puts
    puts "You have advanced a stage!"
    puts
    puts
    puts "Would you like to enter the shop?"
    print "[Y/N]: "
    choice = gets.chomp
    if choice == ""
      StageIncrease(player, monsterDefeated, level)
    end
    Interp(choice,player)
    return 0
  end
  return monsterDefeated
end


Menu()
