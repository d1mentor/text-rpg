#настроили кодировку
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/character'
require_relative 'lib/character_group'
require_relative 'lib/fight'

geroy = Character.new(
  "name" => 'Игрок',
  "hp" => rand(50..200),
  "dmg" => rand(20..50),
  "evasion_chance" => 25
  )

naemnik = Character.new(
  "name" => 'Наемник игрока',
  "hp" => rand(50..200),
  "dmg" => rand(20..50),
  "evasion_chance" => 15
  )

goblin1 = Character.new(
  "name" => 'Гоблин 1',
  "hp" => rand(50..200),
  "dmg" => rand(20..50),
  "evasion_chance" => 25
  )

goblin2 = Character.new(
  "name" => 'Гоблин 2',
  "hp" => rand(50..200),
  "dmg" => rand(20..50),
  "evasion_chance" => 25
  )

group_igrok = CharacterGroup.new([geroy, naemnik])
group_enemy = CharacterGroup.new([goblin1, goblin2])

puts '------------------------------NEW GAME----------------------------------'

fight = Fight.new(group_igrok, group_enemy)
fight.auto_with_output
