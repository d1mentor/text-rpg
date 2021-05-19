#Класс в котором дерутся персонажи

class Fight

  def initialize(group_1, group_2)
    @group_1 = group_1
    @group_2 = group_2
  end

  def auto_with_output
    first_group  = rand(1..2)
    puts "Начинается авто-бой"
    puts "--------------------"
    puts @group_1.to_s
    puts "<--------VS-------->"
    puts @group_2.to_s
    puts "--------------------"

    while @group_1.anybody_alive? && @group_2.anybody_alive? do
      group_1_sample = @group_1.sample_alive_character
      group_2_sample = @group_2.sample_alive_character
      all_alive = group_1_sample != nil && group_2_sample != nil

      if first_group == 1
        group_1_sample.do_attack(group_2_sample) if all_alive
        all_alive = group_1_sample != nil && group_2_sample != nil
        group_2_sample.do_attack(group_1_sample) if all_alive
        sleep(0.1)
      else
        group_2_sample.do_attack(group_1_sample) if all_alive
        all_alive = group_1_sample != nil && group_2_sample != nil
        group_1_sample.do_attack(group_2_sample) if all_alive
        sleep(0.1)
      end
    end

    if @group_1.anybody_alive?
      puts "Победители:"
      puts @group_1.to_s
      puts "Проигравшие:"
      puts @group_2.to_s
    else
      puts "Победители:"
      puts @group_2.to_s
      puts "Проигравшие:"
      puts @group_1.to_s
    end
  end
end
