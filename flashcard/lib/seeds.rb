require 'active_record'

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:database => "flashcard_db"
)

def flashcard_db
	FlashCard.create([
		{category: "animal", question: "What large, clumsy, flightless bird has been extinct for 200 years?", answer: "dodo", point: 2},
		{category: "people", question: "Who was the big winner at the 2015 Grammys Award?", answer: "Sam Smith", point: 1},
		{category: "animal", question: "What animal is the world's largest one?", answer: "blue whale", point: 1},
		{category: "animal", question: "Which animal lays a world's largest egg?", answer: "ostrich", point: 1},
		{category: "people", question: "Who was the first deaf actress to win the Academy Award?", answer: "Marlee Matlin", point: 2},
		{category: "people", question: "Who was the first president of the US?", answer: "George Washington", point: 1},
		{category: "geography", question: "What is the longest river in the world?", answer: "Nile", point: 1},
		{category: "geography", question: "Which country is the largest in the world?", answer: "Russia", point: 1},
		{category: "geography", question: "Which city is the world's largest city?", answer: "Tokyo", point: 1},
		{category: "animal", question: "What animal is the world's smallest mammal?", answer: "bumblebee bat", point: 2},
		{category: "people", question: "Who was the king of pop music?", answer: "Michael Jackson", point: 1},
		{category: "animal", question: "What insect provides food for humans?", answer: "honeybees", point: 2},
		{category: "animal", question: "Why do hummingbirds hum?", answer: "vibration from flapping wings", point: 2},
		{category: "people", question: "Which NFL (football) team won the superbowl in 2012", answer: "Giants", point: 1},
		{category: "geography", question: "Which country has the city called Tokyo?", answer: "Japan", point: 1},
		{category: "geography", question: "Which country has the city called Bangkok?", answer: "Thailand", point: 1},
		{category: "animal", question: "What animal can live very long time", answer: "bowhead whale", point: 2},
		{category: "geography", question: "Where is Stockholm", answer: "Sweden", point: 1},
		{category: "people", question: "What year did Elvis Presley", answer: "1935", point: 1},
		{category: "people", question: "Who was the first president of the US", answer: "George Washington", point: 1},
		{category: "geography", question: "What year did Hawai'i became the state of the US?", answer: "1959", point: 1},
		{category: "geography", question: "Which ocean is the biggest in the world?", answer: "Pacific", point: 1},
		{category: "animal", question: "Which animal/bug kills humans the most?", answer: "mosquito", point: 2},
		{category: "people", question: "Who was Vin Diesel's best friend?", answer: "Paul Walker", point: 1},
		{category: "people", question: "Which US president had the three terms?", answer: "Franklin Roosevelt", point: 2},
		{category: "geography", question: "Which country has the world's largest population?", answer: "China", point: 1},
		{category: "animal", question: "Which animal has hundreds of teeth?", answer: "shark", point: 1}
])
	
end

