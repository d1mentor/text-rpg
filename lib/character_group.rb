#Группа персов

class CharacterGroup

  def initialize(characters)
    @characters = characters
  end

  def anybody_alive?

      @characters.each do |character|

        if character.alive?
          return true
        end
      end
      false
  end

  def sample_alive_character
    alive_characters = []

    @characters.each do |character|
      if character.alive?
        alive_characters << character
      end
    end
    alive_characters.sample
  end

  def to_s
    @characters.each do |character|
      character.to_s
    end
  end
end
