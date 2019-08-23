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

    redirect to "/figures/#{@figure.id}"
  end

end
