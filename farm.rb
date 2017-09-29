class Field
  @@fields = []
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
    when "harvest" then Field.harvest_all
    when "status" then status
    when "relax" then relax
    when "exit" then abort
    end
  end

  def self.plant_corn(area)
    new_corn = Corn.new(area)
    @@fields << new_corn
  end

  def self.plant_wheat(area)
    new_wheat = Wheat.new(area)
    @@fields << new_wheat
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
    if Corn.planted_area == 0 && Wheat.planted_area == 0
      puts "You gaze over a barren landscape and hope for all that could be."
    end
  end

  def self.harvest_all
    @@fields.each do |field|
      if field.class == Corn
        puts "Harvesting #{field.corn} food from #{field.area} hectare corn field."
      elsif field.class == Wheat
        puts "Harvesting #{field.wheat} food from #{field.area} hectare wheat field."
      end
    end
    @@harvested += Corn.harvest
    @@harvested += Wheat.harvest
    self.status
  end
end

class Corn < Field
  @@corn = 0
  @@planted_area = 0
  def initialize(area)
    @area = area
    @corn = 20 * area
    @@planted_area += area
  end

  def corn
    @corn
  end

  def area
    @area
  end

  def self.planted_area
    @@planted_area
  end

  def self.harvest
    @@corn.each { |crop| @@corn += crop.corn }
    @@planted_area = 0
    @@corn
  end
end

class Wheat < Field
  @@wheat = 0
  @@planted_area = 0
  def initialize(area)
    @area = area
    @wheat = 30 * area
    @@planted_area += area
  end

  def self.planted_area
    @@planted_area
  end

  def wheat
    @wheat
  end

  def area
    @area
  end

  def self.harvest
    @@wheat.each { |crop| @@wheat += crop.wheat }
    @@planted_area = 0
    @@wheat
  end
end

farm = Field.new
farm.main_menu
