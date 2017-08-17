class CalculatorController
 
    @formula = ""
    
    def main_menu
        # Display the main menu options to the command line. 
        puts "Main Menu"
        puts "1 - Enter formula to calculate"
        puts "2 - Exit"
       
        print "Enter your selection: "
 
        # Retrieve user input from the command line using gets. gets reads the next line from standard input.
        selection = gets.to_i
        
        case selection
            when 1
                system "clear"
                get_formula
                calculate_answer
                print_answer
                main_menu
            when 2
                puts "Good-bye!"
                # Terminate the program using exit(0). 0 signals the program is exiting without an error. 
                exit(0)
            # Use an else to catch invalid user input and prompt the user to retry. 
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end
 
    def get_formula
        # Clear the screen for before displaying the formula entry prompts. 
        system "clear"
        print "Be sure to put blanks before and after operands.  "
        print "Formula to calculate: "
        @formula = gets.chomp
    end
    
    def calculate_answer
        @calc = @formula.split(" ")
        if (@calc.length == 0)
            main_menu
        else
            multanddiv
            if (@calc.length >= 3)
                addandsub
            end
        end
    end
    
    def multanddiv
        x = 1
        while (x <= @calc.length)
            if (@calc[x] == "*" || @calc[x] == "/")
                if (@calc[x] == "*")
                    answer = @calc[x-1].to_i * @calc[x+1].to_i
                else
                    answer = @calc[x-1].to_i / @calc[x+1].to_i
                end
                @calc[x-1] = answer
                @calc.slice!(x,2)
            else
                x += 2
            end
        end
    end
    
    def addandsub
        while (@calc.length > 1)
            if (@calc[1] == "+" || @calc[1] == "-")
                if (@calc[1] == "+")
                    answer = @calc[0].to_i + @calc[2].to_i
                else
                    answer = @calc[0].to_i - @calc[2].to_i
                end
                @calc[0] = answer
                @calc.slice!(1,2)
            end
        end
    end
    
    def print_answer
        puts "#{@formula} = #{@calc[0]}"
    end
    
end