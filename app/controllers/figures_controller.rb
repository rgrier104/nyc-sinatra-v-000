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

    erb :'/figures/show'
  end

  post '/figures' do

    @figure = Figure.create(params[:figure])

    if !params[:figure][:landmark_ids].empty?
      @figure.landmarks << Landmark.find(params[:figure][:landmark_ids])
    else
      @new_landmark = Landmark.create(params[:landmark][:name])
      @figure.landmarks << @new_landmark
    end

    if !params[:figure][:title_ids].empty?
      @figure.titles << Title.find(params[:figure][:title_ids])
    else
      @new_title = Title.create(params[:title][:name])
      @figure.titles << @new_title
    end

    redirect to "/figures/#{@figure.id}"
  end

end
