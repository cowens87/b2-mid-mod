class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
  end 

  def new
  end

  def create
    require 'pry'; binding.pry
    movie = Movie.find(params[:id])
    movie.actors.create!(actor_params)
    if movie.save
      redirect_to movie_path(movie.id)
    end
  end

  def actor_params
    params.permit(:name, :age)
  end
end