require 'active_record'
require 'pry'
require_relative 'flashcard_app'
require_relative 'seeds.rb'

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

def list_all_flashcards
	FlashCard.all.each do |x|
		puts "|#{x.id}|  Category: #{x.category}  Question: #{x.question}  Answer: #{x.answer}  Point Value: #{x.point}"
	end
end

def list_all_decks
	Deck.all.each do |x|
		puts "|#{x.id}|  Name: #{x.name}  Number of Cards: #{x.num_cards}  Total Points: #{x.total_points_in_deck}"
	end
end

def find_the_flashcard
	FlashCard.where(category: @category_choice).each do |y|
		puts "|#{y.id}|  Category: #{y.category}  Question: #{y.question}  Answer: #{y.answer}  Point Value: #{y.point}"
	end
end

def show_flashcards_from_deck
	@Deck1.flash_cards.all.each do |x|
		puts "#{x.id} #{x.category} #{x.question}"
	end
end

def select_deck_n_show
	@deck.flash_cards.all.each do |y|
		puts "#{y.id} #{y.category} #{y.question}"
	end
end

# def deck_shuffle

# 	return @deck.flash_cards(id: 0..4).order("RANDOM()").first
	
# end



def clear_screen
	print "\e[2J\e[f"
end

clear_screen


loop do 
	puts "---------------------------------------------"
	puts "           WELCOME TO MY FLASHCARD           "
	puts "---------------------------------------------"
	puts " Please type the number to select"
	puts " 1. Play the game!"
	puts " 2. Manage the FlashCards"
	puts " 3. Manage the Decks"
	puts " 4. Option"
	puts " 5. Quit"
	puts "---------------------------------------------"

	menu_choice = gets.chomp.to_i

	case menu_choice
		when 1 
			puts "Let's Play!"
			puts ""
			# puts "Enter your User Name"
			# get user input
			# user_name = gets.chomp
			# puts " Enter your password"
			# user_password = gets.chomp

			puts "--------------------------------------------------------"
			puts " Please type the id number of the deck you want to play "
			list_all_decks
			puts "--------------------------------------------------------"
			deck_choice = gets.chomp.to_i
			# get user input

			@deck = Deck.find(deck_choice)
			
			# select_deck_n_show			
			random_id = @deck.flash_cards.pluck(:id)
			random_model = @deck.flash_cards.find(random_id.sample)
			puts " The flashcard draws..."
			puts "-----------------------------------------------------"
			puts random_model.question
			
			puts " Please answer the question above. "
			user_answer = gets.chomp

			if user_answer == random_model.answer
				puts "Your answer is correct! Next question!"

			elsif user_answer != random_model.answer

				puts "Your answer is either wrong or mispelled."

			end


			# puts card_ids.question
			


		when 2
			clear_screen 
			puts "-------------------------------------------"
			puts "             FlashCards Manager            "
			puts "-------------------------------------------"
			puts " Please type the number to select "
			puts " 1. List all flashcards"
			puts " 2. Search the flashcard"
			puts " 3. Add a new flashcard to the database"
			puts " 4. Remove the flashcard from the database"
			puts " 5. Edit the flashcard"
			puts " 6. Return back to the main menu"

			flashcard_manager = gets.chomp.to_i

			case flashcard_manager
				when 1
					clear_screen
					puts "-------------------------------------------"
					puts "         List of all the flashcards        "
					puts "-------------------------------------------"
					puts ""

					list_all_flashcards

				when 2
					clear_screen
					puts "Type the category to search"
					@category_choice = gets.chomp

					find_the_flashcard 

				when 3
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

				when 4
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

				when 5

					FlashCard.all.each_with_index do |card, index|
					
						puts "|#{card.id}||CATEGORY| #{card.category} |QUESTION| #{card.question} |ANSWER| #{card.answer}  |POINT| #{card.point}"

					end
					index = gets.chomp.to_i
					@card = FlashCard.find(index)
					clear_screen
					puts ""
					puts "#{@card.id}||CATEGORY| #{@card.category} |QUESTION| #{@card.question} |ANSWER| #{@card.answer}  |POINT| #{@card.point}"
					puts @card.question
					# puts "Type the something to update the category."
					# name_category = gets.chomp
					
					# puts ""
					# @card.update(category: name_category)
	  				

				when 6
					clear_screen
					next

				else
					puts "Please type the proper number"
				end

		when 3
			clear_screen 
			puts "-------------------------------------------"
			puts "             Decks Manager            "
			puts "-------------------------------------------"
			puts " Please type the number to select "
			puts " 1. List all the decks"
			puts " 2. Search the deck"
			puts " 3. Create a new deck to the table"
			puts " 4. Remove the deck from the table"
			puts " 5. Push the flashcards into the deck"
			puts " 6. Return back to the main menu"

			deck_manager = gets.chomp.to_i

				case deck_manager
					when 1
						clear_screen
						puts "-------------------------------------------"
						puts "         List of all the decks        "
						puts "-------------------------------------------"
						puts ""

						list_all_decks

					when 2
						puts "Under construction"

					when 3 
						clear_screen
						puts "-------------------------------------------"
						puts "            Add a new Deck            "
						puts "-------------------------------------------"
						puts ""
						puts " Name this deck"
						deck_name = gets.chomp

						Deck.create(name: deck_name, num_cards: [], total_points_in_deck: [])	

					when 4
						clear_screen
						puts "-------------------------------------------"
						puts "            Delete the deck           "
						puts "-------------------------------------------"
						puts ""
				
						Deck.all.each do |x|
						puts "#{x.id}: #{x.name}. #{x.num_cards}. #{x.total_points_in_deck}."
						puts "Select the flashcard's ID number to remove"
						end

						deck_delete_choice = gets.chomp.to_i
						Deck.delete(deck_delete_choice)

					when 5 
						clear_screen
						puts "-------------------------------------------"
						puts "       Push the flashcards into the deck         "
						puts "-------------------------------------------"
						puts " Type the number of which deck you want to push the flashcards"
						list_all_decks

						deck_push = gets.chomp.to_i
						
						puts "---------------------------------------------------------------------"
						puts " Please type the PROPER name of the category of the flash cards "
						puts " to push into the selected deck from the list below:"
						puts "---------------------------------------------------------------------"
						puts " 1. animal"
						puts " 2. people"
						puts " 3. geography"

						deck_category_choice = gets.chomp
						# Deck.create(name: "animal")

						Deck.find(deck_push).flash_cards << FlashCard.where(category: deck_category_choice)
						

					when 6
						clear_screen
						next

					else
						puts "Please type the proper number"
					end
		when 4 
			clear_screen
			puts "------------------------------------------------------------------"
			puts "                               Option                             "
			puts "------------------------------------------------------------------"
			puts " Please type the number to select"
			puts " 1. Create a new table if the table doesn't exist"
			puts " 2. Remove the existing table (WARNING: It will erase everything)"
			puts " 3. Add the specific seeds into the database"
			puts " 4. Enter in pry                                                  "
			puts " 5. Return back to the main menu"
			puts "------------------------------------------------------------------"

			option_choice = gets.chomp.to_i

			case option_choice
				when 1
				 	CreateFlashCard.new	

				when 2
					clean_slate

				when 3
					clear_screen
					puts "-----------------------------------------------------"
					puts " Please type the number to import the database. "
					puts " 1. FlashCard Seeds"
					puts " 2. Deck Seeds"
					puts " 3. Users Seeds"
					puts " 4. Return back to the option"
					puts "-----------------------------------------------------"

					database_choice = gets.chomp.to_i

					case database_choice
						when 1 
							flashcard_db

						when 2
							deck_db

						when 3 
							user_db

						when 4 
							clear_screen
							menu_choice = 4
						else
							puts "Please type the proper number."
						end

					

				when 4
					binding.pry

				when  5
					clear_screen
					next
				else
					puts "Please type the proper number"
				end

		when 5 
			clear_screen
			puts "Goodbye!"
			exit 

	end
end

