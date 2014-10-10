Dir.chdir(File.dirname(__FILE__))

def loadJokes( path )
	savedJokes = []
	i = 0
	File.foreach(path) { |line|
		savedJokes[i] = line
		i = i + 1
	}
end 

def tellRandomJoke(savedJokes) 
	puts "#{savedJokes[rand(savedJokes.length)]}"
end

def saveJoke(userKnock, userWho, userPunch) 
	open('myJokes.txt', 'a') {|file|
		file.puts "#{userKnock} Who's there? #{userWho} #{userWho} who? #{userPunch}"
	}
end

puts "Tell me a knock knock joke NERD!"

userKnockKnock = gets.chomp
if userKnockKnock =~ /knock/
	puts "Who's there?"
else
	puts "That's not how you start a knock knock joke! Try again!"
	abort
end

userJokeWho = gets.chomp
puts "#{userJokeWho} who?"

userJokePunch = gets.chomp
puts "HAHAHA! That's hilarious....kinda..."
puts "I'm going to save that for later!"
saveJoke(userKnockKnock, userJokeWho, userJokePunch)

puts "Here's a joke in return!"
tellRandomJoke(loadJokes('myJokes.txt').to_a)