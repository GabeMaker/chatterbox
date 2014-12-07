def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2, c3: $3}
end

def add_new
    puts "What question would you like to add?: "
    query = gets.chomp
    puts "What response would you like for '#{query}'?"
    answer = gets.chomp
    RESPONSES[query] = answer
    puts "Response added!"
end

def save_responses
  file = File.open("responses.csv", "w")
  RESPONSES.each do |query, answer|
    line = "#{query}, #{answer}"
    file.puts line
  end
  file.close
end

# def load_students
#   file = File.open("students.csv", "r")
#   file.readlines.each do |line|
#   name, cohort = line.chomp.split(',')
#     @students << {:name => name, :cohort => cohort.to_sym}
#   end
#   file.close
# end


# courtesy of http://stackoverflow.com/questions/1489183/colorized-ruby-output
class String
def red;            "\033[31m#{self}\033[0m" end
def green;          "\033[32m#{self}\033[0m" end
end

RESPONSES = { 'A=(.*) B=(.*) C=(.*)' => 'Then %{c1} squared equals %{c2} squared plus %{c3} squared - assuming A is the length of the longest side of a right angled triangle and B and C are the remaining lengths. Simple, eh?',

              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
          	  'I hate (.*)'=> 'I don\'t hate %{c1}, but I\'m not that keen',
          	  'why(.*)' => 'why indeed... but what does it matter?',
          	  '(.*) or (.*)' => 'choices, choices! %{c2} ... %{c1}...? - I can\'t decide!',

          	  'goodbye' => 'bye', 
              'sayonara' => 'sayonara',
              'Hi' => 'Hi there!',
          	  'Hello' => 'Hello!',
          	  'hi' => 'hi!',
          	  'hello' => 'hello!',
          	  'how are you?' => 'Pretty good, thank you. And you?',
          	  'ok' => 'OK is okay... Could be worse I guess',
          	  'good' => 'Good? good is great!',
          	  'yeah' => 'yep',
          	  'name' => 'My name is Chatbot',
          	  'chatbot' => 'That\'s my name!',
          	  'Chatbot' => 'That\'s what they call me!',
          	  'help' => 'If you feel stuck with me (and you\'re running me from command line using "ruby chatbot.rb") press ctrl + C to exit'}

puts "Chatbot: Hello, what's your name?".red
print "You".capitalize.green + ": ".green
name = gets.chomp
puts "Chatbot: Hello #{name.capitalize}".red
print name.capitalize.green + ": ".green
while(input = gets.chomp) do
  break if input == "quit"
  if input == "add_new"
    add_new
  else
    puts "Chatbot: ".red + get_response(input).red
  end

  print name.capitalize.green + ": ".green
end

save_responses