require 'active_record'
require 'pry'
 	
class DeckCard < ActiveRecord::Base
	has_many :flash_cards
	has_many :users
	belongs_to :users

end

class FlashCard < ActiveRecord::Base
	belongs_to :DeckCard
end

class User < ActiveRecord::Base
	has_many :flash_cards
	has_many :deck_cards
end

class CreateFlashCard < ActiveRecord::Migration 
	def initialize 
		create_table :flash_cards do |column|
			column.string :category
			column.text :question
			column.text :answer
			column.integer :point

		end
	
		create_table :deck_cards do |column|
			column.string :category
			column.text :description
			column.integer :num_cards
		end

		create_table :users do |column|
			column.string :name
			column.string :location
			column.integer :point
		end

	end


end