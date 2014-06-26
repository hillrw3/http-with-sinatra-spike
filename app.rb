require "sinatra/base"

class MyApp < Sinatra::Application

  def initialize
    super
    @items = ["Channa Masala", "Chicken Tikka Masala", "Saag Paneer"]
  end

  get '/' do
    erb :root
  end


  get '/items' do
    filter = params[:filter]
    new_ary = @items
    unless filter == nil
      new_ary = @items.select{|item| item.downcase.include?(filter.downcase)}
    end
    erb :items, :locals =>{:items => new_ary}
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
