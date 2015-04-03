require 'active_record'
require 'pry'
 	
class Deck < ActiveRecord::Base
	has_many :flash_cards
	has_many :users
	belongs_to :user

	
end

class FlashCard < ActiveRecord::Base
	belongs_to :deck
end

class User < ActiveRecord::Base
	has_many :flash_cards
	has_many :decks
end

class CreateFlashCard < ActiveRecord::Migration 
	def initialize 
		create_table :flash_cards do |column|
			column.string :category
			column.text :question
			column.text :answer
			column.integer :point
			column.belongs_to :deck
		end
	
		create_table :decks do |column|
			column.string :name
			column.integer :num_cards
			column.integer :total_points_in_deck
			column.belongs_to :user
		end

		create_table :users do |column|
			column.string :user_name
			column.string :password
			column.integer :point
		end

	end


end

