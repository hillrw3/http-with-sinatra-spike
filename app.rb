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

  post '/items' do
    @items.push(params[:newitem])
    redirect back
  end

  get '/items/new' do
    erb :new
  end

  get '/items/:id' do
    id = params[:id]
    erb :id, :locals => {:id => id, :item_name => @items[id.to_i]}
  end

  get '/items/:id/edit' do
    id = params[:id]
    erb :edit, :locals => {:id => id, :item_name => @items[id.to_i]}
  end



  run! if app_file == $0
end
