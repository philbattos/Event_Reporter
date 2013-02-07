####
# Event Reporter
# by Phil Battos
# Submitted 02/07/2013
####

################################
### Steve's suggested start

#$ cat bin/event_reporter                                              
#!/usr/bin/env ruby 

# require 'event_reporter'

# er = EventReporter.new

# loop do
#   print "> "
#   input = gets
#   puts "YOU TYPED #{input}"

#   er.do_something(input)
# end

#################################

require "csv"
# require "sunlight"
# require "erb"

# Sunlight::Base.api_key = "e179a6973728c4dd3fb1204283aaccb5"

puts "Event Reporter Initialized..." 

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# def zipcode_to_rep_names(zip)
#   Sunlight::Legislator.all_in_zipcode(zip)
# end

# def clean_phone(phone)
#   phone = phone.to_s.gsub(/[-.()]/, '').split(" ").join
#     if phone.length < 10
#       phone = "Invalid phone: too short"
#     elsif phone.length > 11
#       phone = "Invalid phone: too long"
#     elsif phone.length == 10
#       phone = phone
#     elsif phone[0] == 1
#       phone = phone
#     else 
#       phone = "Invalid phone"
#     end
# end

# contents.each do |row|
#   id = row[0]
#   name = row[:first_name]
  # zip = clean_zipcode(row["Zipcode"])
  # rep_names = zipcode_to_rep_names(zip)
  # form_letter = erb_template.result(binding)
  # phone = clean_phone(row[:homephone])

  # reg = row[:regdate]
  # format = "%m/%d/%y %H:%M"
  # hour = DateTime.strptime(reg, format).strftime("%H").to_i
  # day = DateTime.strptime(reg, format).strftime("%A")
  # reg_numbers[hour] = reg_numbers[hour] +1

    # if reg_numbers[hour] > hour_most_count
    # hour_most = hour
    # hour_most_count = reg_numbers[hour]
  # end

  
  # puts phone

def run

  hash = {
    quit: "quit",
    load: "load <filename>",
    help: "help",
    help_description: "help <command>",
    queue_count: "queue count",
    queue_clear: "queue clear",
    queue_print: "queue print",
    queue_print_attribute: "queue print by <attribute>",
    queue_save: "queue save to <filename>",
    find: "find <attribute> <criteria>"
  }

  command = ""
  while command != "quit"
    printf "Enter command or type 'help': "
    input = gets.chomp.downcase
    parts = input.split
    command = parts[0]

    help_quit = "Type '#{hash[:quit]}' to exit"
    help_help = "Type '#{hash[:help]}' to see the list of the available commands"
    help_help_command = "Type '#{hash[:help_description]}' to see a description of how to use that command"
    help_queue_count = "Type '#{hash[:queue_count]}' to see how many records are in the current queue"
    help_queue_clear = "Type '#{hash[:queue_clear]}' to clear the current queue"
    help_queue_print = "Type '#{hash[:queue_print]}' to print the current queue"
    help_queue_print_attribute = "Type '#{hash[:queue_print_attribute]}' to print queue by attribute"
    help_queue_save = "Type '#{hash[:queue_save]}' to save queue to a filename"
    help_find = "Type '#{hash[:find]}' to search for a keyword"

    case command
      when hash[:quit] then puts "Goodbye!"
      when hash[:load] then puts "File is loading..."
        ### "Erase any loaded data and parse the specified file. If no filename is given, default to event_attendees.csv."
        
        contents = CSV.open 'event_attendees.csv', :headers => true, header_converters: :symbol
        contents
        
      when hash[:help] then puts "You may type any of the following commands: ", hash[:quit].center(32), "help".center(32), hash[:load].center(32), hash[:help_description].center(32), 
        hash[:queue_count].center(32), hash[:queue_clear].center(32), hash[:queue_print].center(32), hash[:queue_print_attribute].center(32), hash[:queue_save].center(32), hash[:find].center(32)
        ### "Output a listing of the available individual commands."
      when "#{hash[:help]}-#{hash[:quit]}" then puts help_quit
      when "#{hash[:help]}-#{hash[:load]}" then puts help_load
      when "#{hash[:help]}-#{hash[:help]}" then puts help_help
      when "#{hash[:help]}-#{hash[:help_description]}" then puts help_help_description
      when "#{hash[:help]}-#{hash[:queue_count]}" then puts help_queue_count
      when "#{hash[:help]}-#{hash[:queue_clear]}" then puts help_queue_clear
      when "#{hash[:help]}-#{hash[:queue_print]}" then puts help_queue_print
      when "#{hash[:help]}-#{hash[:queueu_print_attribute]}" then puts help_queue_print_attribute
      when "#{hash[:help]}-#{hash[:queue_save]}" then puts help_queue_save
      when "#{hash[:help]}-#{hash[:find]}" then puts help_find
        ### "Output a description of how to use the specific command." 

      when 'queue count'
        ### "Output how many records are in the current queue."
      when 'queue clear' 
        ### "Empty the queue"
      when 'queue print'
        ### Print out a tab-delimited data table with a header row following this format:
        ### -LAST NAME- -FIRST NAME- -EMAIL- -ZIPCODE- -CITY- -STATE- -ADDRESS- -PHONE-
      when 'queue print by <attribute>'
        ### Print the data table sorted by the specified attribute like zipcode.
      when 'queue save to <filename.csv>'
        ### Export the current queue to the specified filename as a CSV. 
        ### The file should should include data and headers for last name, first name, email, zipcode, city, state, address, and phone number.
      when 'find <attribute> <criteria>'
        ### Load the queue with all records matching the criteria for the given attribute. Example usages:
        ### find zipcode 20011
        ### find last_name Johnson
        ### find state VA
        ### (refer to page for more instructions...)
      else
        puts "Sorry, #{command} is not a valid command. Please try again."

    end
  end
end

run

