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
      puts "Added a #{user_crop} field of #{user_area} hectares!"
    when "harvest" then
    when "status" then status
    when "relax" then relax
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

  def relax
  if Corn.planted_area > 0
    puts "#{Corn.planted_area} hectares of tall green stalks rustling in the breeze fill your horizon."
  end
  if Wheat.planted_area > 0
    puts "The sun hangs low, casting an orange glow on a sea of #{Wheat.planted_area} hectares of wheat"
  end
  if Corn.planted_area > 0 && Wheat.planted_area > 0
    puts "You gaze over a barren landscape and hope for all that could be."
  end
  end

end

class Corn < Field
  @@corn = 0
  @@planted_area = 0
  def initialize(area)
    @area = area
    @corn = area * 20
    @@planted_area += area
  end

  def self.planted_area
    @@planted_area
  end

  def self.harvest
    @@corn += @corn
    @@planted_area = 0
  end
end

class Wheat < Field
  @@wheat = 0
  @@planted_area = 0
  def initialize(area)
    @area = area
    @wheat = area * 30
  end

  def self.planted_area
    @@planted_area
  end

  def self.harvest
    @@wheat += @wheat
    @@planted_area = 0
  end

end

farm = Field.new
farm.main_menu

# Field.plant_wheat(1)
# Field.plant_corn(1)
