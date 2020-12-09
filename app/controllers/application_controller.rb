
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #root
  get '/' do
    redirect '/articles'
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  #show
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  #edit
  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  #update
  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])

    redirect "/articles/#{@article.id}"
  end

  #delete
  delete '/articles/:id' do
    Article.destroy(params[:id])

    redirect '/articles'
  end
end
