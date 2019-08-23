class FiguresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/figures' do
    @figures = Figure.all

    erb :'/figures/index'
  end

  get '/figures/new' do

    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :'/figures/edit'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])

    if !params[:figure].keys.include?("landmark_ids")
      params[:figure]["landmark_ids"] = []
    end

    if !params[:figure].keys.include?("title_ids")
      params[:figure]["title_ids"] = []
    end

    if !params[:figure][:landmark_ids].empty?
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids])
    elsif params[:landmark][:name]
      @new_landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @new_landmark
    end

    if !params[:figure][:title_ids].empty?
      @figure.titles << Title.find(params[:figure][:title_ids])
    elsif params[:title][:name]
      @new_title = Title.create(params[:title])
      @figure.titles << @new_title
    end

    redirect to "/figures/#{@figure.id}"
  end

  patch '/figures' do
    

    redirect to "figures/#{@figure.id}"
  end

end
