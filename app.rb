require 'sinatra'

configure :development do
  set :bind, '0.0.0.0' #ok to listen to anybody
  set :port, 3000  #use localhost:3000
end

STATES = ['California', 'Oregon', 'Washington', 'Texas', 'Vermont']
CAPITALS = {
  'California' => 'Sacramento',
  'Oregon' => 'Salem',
  'Washington' => 'Olympia',
  'Texas' => 'Austin',
  'Vermont' => 'Montepelier'
  }

  
get '/' do
  @state=STATES.sample
  erb :home
end

get '/make_guess' do  #would never put "?"" in the make_guess name because ? indicates to server that calling query
  
  capital = CAPITALS[params[:state]]
  puts "your guess was: #{params[:capital]}" #params is way to run input in form through url parameters 
  puts "the correct answer is: #{capital}"  
#puts request.inspect ???

  
  if params[:capital] == capital
    'correct answer!'
  else
    'wrong answer'
  end
end