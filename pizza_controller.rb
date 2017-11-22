require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza.rb')

#INDEX
get '/pizzas' do
  @all_pizzas = Pizza.all()
  erb(:index)
end

#NEW
get '/pizzas/new' do
  erb(:new)
end

#SHOW
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#EDIT
get "/pizzas/:id/edit" do
 @pizza = Pizza.find(params[:id])
 erb(:edit)
end

#CREATE
post '/pizzas' do
  pizza = Pizza.new(params)
  pizza.save()
  erb(:create)
end

#update
put '/pizzas/:id' do
  pizza = Pizza.new(params)
  pizza.update
  redirect to ('/pizzas')
end

#DELETE
post '/pizzas/:id' do
  id = params[:id]
  pizza = Pizza.find(id)
  pizza.delete
  redirect to("/pizzas")
end
