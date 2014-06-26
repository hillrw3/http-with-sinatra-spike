require "sinatra/base"

class MyApp < Sinatra::Application

  def initialize
    super
    @items = ["item 1", "item 2", "item 3"]
  end

  get '/' do
    erb :root
  end


  get '/items' do
    erb :items, :locals =>{:item_count => @items.length}
  end

  get '/items/new' do
    erb :new
  end

  get '/items/:id' do
    id = params[:id]
    "This item's id is #{id.to_i + 1}"
  end


  run! if app_file == $0
end
