class Movie < ApplicationRecord
  validates_presence_of :title, :creation_year, :genre
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  def actors_by_age
    actors.order(age: :desc)
  end

  def actor_avg_age
    actors.average(:age)
  end
end
