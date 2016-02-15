# #1 Address Book
 require_relative '../models/address_book'
 
 class MenuController
   attr_accessor :address_book
 
   def initialize
     @address_book = AddressBook.new
   end
 
   def main_menu
 # #2 Main Menu Commands
     puts "Main Menu - #{@address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - View Entry n"
     puts "6 - Exit"
     print "Enter your selection: "
 
 # #3 Input Commands
     selection = gets.to_i
     
 # #7 CASE COMMANDS
     case selection
     when 1
       system "clear"
       view_all_entries
       main_menu
     when 2
       system "clear"
       create_entry
       main_menu
     when 3
       system "clear"
       search_entries
       main_menu
     when 4
       system "clear"
       read_csv
       main_menu
     when 5
        system "clear"
        entry_n_submenu
        main_menu
        
     when 6
       puts "Good-bye!"
 # #8 EXIT
       exit(0)
 # #9 INVALID TRY AGAIN!!
     else
       system "clear"
       puts "Sorry, that is not a valid input"
       main_menu
     end
   end
   
 # #10 RESET
   def view_all_entries
   end
 
   def create_entry
        # #11
     system "clear"
     puts "New AddressBloc Entry"
 # #12
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
 
 # #13
     @address_book.add_entry(name, phone, email)
 
     system "clear"
     puts "New entry created"
   end
 
   def search_entries
       # #14
     @address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
 # #15
       entry_submenu(entry)
     end
 
     system "clear"
     puts "End of entries"
   end
 
    def entry_submenu(entry)
 # #16
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"
 
 # #17
     selection = gets.chomp
 
     case selection
 # #18
     when "n"
 # #19
     when "d"
     when "e"
 # #20
     when "m"
       system "clear"
       main_menu
     else
       system "clear"
       puts "#{selection} is not a valid input"
       entry_submenu(entry)
     end

   def entry_n_submenu
      print "Entry number to view: "
      selection gets.chomp.to_i
      
      if selection < @address_book.entries.count
          puts @address_book.entries[selection]
          puts "Press enter to return to the main menu"
          gets.chomp
          system "clear"
      else 
          puts "#{selection} is invalid"
          entry_n_submenu
          
      end
   end
 
   def read_csv
   end
 end
end     
