#Класс отецъ любого персонажа ин зис факин гейм
#Персонажа - тоесть непися, врага, игрока
#Тут описано то, что свойственно каждому любому персонажу

class Character
  attr_reader :name

  def initialize(args)
    @name = args["name"]
    @health = args["hp"]
    @damage = args["dmg"]
    @evasion_chance = args["evasion_chance"]
  end

  def do_attack(target)
    puts "#{@name} =атакует> #{target.name}!"
    target.be_attacked(@damage)
  end

  def be_attacked(dmg)
    if evasion?
      puts "#{@name} уклоняется!"
    else
      @health -= dmg
      puts "#{@name} получает #{dmg} урона!"

      unless alive?
        puts "\n#{@name} Погибает!\n "
      end
    end
  end

  def evasion?
    evasion = rand(1..100)
    (1..@evasion_chance).include?(evasion)
  end

  def alive?
    @health > 0
  end

  def to_s
    "#{@name}[#{@health}hp/#{@damage}dmg]"
  end

end
