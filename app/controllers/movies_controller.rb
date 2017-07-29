class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])
    @character = Character.new
    render("movies/show.html.erb")
  end

  def new
    @movie = Movie.new

    render("movies/new.html.erb")
  end

  def create
    @movie = Movie.new

    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie created successfully.")
    else
      render("movies/new.html.erb")
    end
  end

  def edit
    @movie = Movie.find(params[:id])

    render("movies/edit.html.erb")
  end

  def update
    @movie = Movie.find(params[:id])

    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    save_status = @movie.save

    if save_status == true
      redirect_to("/movies/#{@movie.id}", :notice => "Movie updated successfully.")
    else
      render("movies/edit.html.erb")
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy

    if URI(request.referer).path == "/movies/#{@movie.id}"
      redirect_to("/", :notice => "Movie deleted.")
    else
      redirect_to(:back, :notice => "Movie deleted.")
    end
  end
end
