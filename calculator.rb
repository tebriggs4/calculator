require_relative 'controllers/calculator_controller'
 
# Create a new CalculatorController when calculator starts. 
calculator = CalculatorController.new

# Use  system "clear" to clear the command line.
system "clear"

puts "Welcome to Calculator!"

# call main_menu to display the menu.
calculator.main_menu