def get_response(input)
  key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  /#{key}/ =~ input
  response = RESPONSES[key]
  response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}',
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

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"
while(input = gets.chomp) do
  puts get_response(input)
end