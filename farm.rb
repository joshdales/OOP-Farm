class Field
  @@harvested = 0
  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_selected = gets.chomp
      call_option(user_selected)
    end
  end

  def print_main_menu
  puts "field -> adds a new field"
  puts "harvest -> harvests crops and adds to total harvested"
  puts "status -> displays some information about the farm"
  puts "relax -> provides lovely descriptions of your fields"
  puts "exit -> exits the program"
  end

  def call_option(user_selected)
    case user_selected
    when "field" then puts "What kind of field is it: corn or wheat?"
      user_crop = gets.chomp
      if user_crop == "corn"
        puts "How large is the field in hectares?"
        user_area = gets.chomp.to_i
        Field.plant_corn(user_area)
      elsif user_crop == "wheat"
        puts "How large is the field in hectares?"
        user_area = gets.chomp.to_i
        Field.plant_wheat(user_area)
      end
    when "harvest" then
    when "status" then status
    when "relax" then
    when "exit" then abort
    end
  end

  def self.plant_corn(area)
    new_corn = Corn.new(area)
  end

  def self.plant_wheat(area)
    new_wheat = Wheat.new(area)
  end

  def status
    puts "The farm has harvested #{@@harvested} food so far."
  end

  def rest
    puts "#{Corn.area} hectares of tall green stalks rustling in the breeze fill your horizon. \nThe sun hangs low, casting an orange glow on a sea of #{Wheat.area} hectares of wheat"
  end

end

class Corn < Field
  @@corn = 0
  def initialize(area)
    @area = area
    @corn = area * 20
  end

  def area
    @area
  end
end

class Wheat < Field
  def initialize(area)
    @area = area
    @wheat = area * 30
  end

  def area
    @area
  end
end

farm = Field.new
farm.main_menu

# Field.plant_wheat(1)
# Field.plant_corn(1)
