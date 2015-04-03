require 'active_record'
require 'pry'
require_relative 'flashcard_app'

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "flashcard_db"
)

def clean_slate
	ActiveRecord::Base.connection.tables.each do |table|
		ActiveRecord::Base.connection.drop_table(table)
	end
end

def clear_screen
	print "\e[2J\e[f"
end

clear_screen

loop do 
	puts "---------------------------------------------"
	puts "           WELCOME TO MY FLASHCARD           "
	puts "---------------------------------------------"
	puts " Please type the number to select"
	puts " 1. List all the flashcards"
	puts " 2. Add a flashcard"
	puts " 3. Delete the flashcard"
	puts " 4. Option"
	puts " 5. Quit"
	puts "---------------------------------------------"

	menu_choice = gets.chomp.to_i

	case menu_choice

		when 1 
			clear_screen
			puts "-------------------------------------------"
			puts "         List of all the flashcards        "
			puts "-------------------------------------------"
			puts ""

			FlashCard.all.each do |x|
				puts "#{x.id}: #{x.category}. #{x.question}. #{x.answer}. #{x.point}."
			end

		when 2 
			clear_screen
			puts "-------------------------------------------"
			puts "            Add a new flashcard            "
			puts "-------------------------------------------"
			puts ""
			puts " Name the category"
				flashcard_category = gets.chomp
			puts " Insert the question "
				flashcard_question = gets.chomp
			puts " Insert the answer for this question "
				flashcard_answer = gets.chomp
			puts " Insert the point value (1 or 2)"
				flashcard_point = gets.chomp.to_i

			FlashCard.create(category: flashcard_category, question: flashcard_question, answer: flashcard_answer, point: flashcard_point)

		when 3
			clear_screen
			puts "-------------------------------------------"
			puts "            Delete the flashcard           "
			puts "-------------------------------------------"
			puts ""
			FlashCard.all.each do |x|
				puts "#{x.id}: #{x.category}. #{x.question}. #{x.answer}. #{x.point}."
				puts "Select the flashcard's ID number to remove"
			end

			delete_choice = gets.chomp.to_i
			FlashCard.delete(delete_choice)

		when 4 
			clear_screen
			puts "------------------------------------------------------------------"
			puts "                               Option                             "
			puts "------------------------------------------------------------------"
			puts " Please type the number to select"
			puts " 1. Create a new table if the table doesn't exist"
			puts " 2. Remove the existing table (WARNING: It will erase everything)"
			puts " 3. Enter in pry                                                  "
			puts " 4. Return back to the main menu"
			puts "------------------------------------------------------------------"

			option_choice = gets.chomp.to_i

			case option_choice
				when 1
				 	FlashCard.new	

				when 2
					clean_slate

				when 3
					binding.pry

				when 4
					break

				else
					puts "Please type the proper number"
				end

		when 5 
			clear_screen
			puts "Goodbye!"
			exit 

	end
end

