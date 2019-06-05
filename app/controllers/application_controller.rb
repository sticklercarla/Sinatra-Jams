require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  patch '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @artist.update(params[:artist])
    redirect to "/artists/#{@artist.id}"
  end
  

  delete '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    @artist.destroy
    redirect to "/artists"
  end

  get "/" do
    erb :welcome
  end

  get '/artists' do
    @artists = Artist.all 
    erb :artists
  end

  get '/artists/new' do
    erb :new
  end

  get '/artists/:id' do
    @artist = Artist.find_by(id: params[:id])
    erb :show
  end

  post '/artists' do
    @artist = Artist.create(params[:artist])
    redirect to "/artists/#{@artist.id}"
  end

  get '/artists/:id/edit' do
    @artist = Artist.find_by(id: params[:id])
    erb :edit
  end

end
