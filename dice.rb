require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do

  erb(:elephant)

end


get("/dice/2/6") do
  @rolls = [] 
  2.times do
    die = rand(1..6)
    @rolls.push(die)
  end
  
  #sum = first_die + second_die

  # @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six)
end

get("/dice/2/10") do
  @rolls = [] 
  2.times do
    die = rand(1..10)
    @rolls.push(die)
  end
  
  erb(:two_ten)
end


get("/dice/1/20") do
  @rolls = [] 
  1.times do
    die = rand(1..20)
    @rolls.push(die)
  end

  #@outcome = "You rolled a #{@die}."

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = [] 
  5.times do
    die = rand(1..4)
    @rolls.push(die)
  end

  #@outcome = "You rolled a #{@die}."

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end
