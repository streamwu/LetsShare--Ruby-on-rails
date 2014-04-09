class ActorsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @actors = Actor.all.order("name asc")

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render :json => @actors, :except => :id
      end
      format.xml {render xml:@actors}  #also can use the api by this kind style
    end
  end

  def show
    the_actor_id = params["id"]
    @actor = Actor.find_by :id => the_actor_id
  end

  def destroy
    the_actor_id = params["id"]
    a = Actor.find_by(:id => the_actor_id)
    a.destroy
    redirect_to actors_url
  end

  def new
  	@movie = Movie.find_by(:id => params[:movie_id])
  end

  def create
    movie = Movie.find_by(:id => params[:movie_id])
    a = Actor.find_by(:name => params[:name])
    if a
    else
      a = Actor.new
      a.name = params["name"]
      a.birthdate = params["birthdate"]
      a.gender = params["gender"]
      a.country = params["country"]
      a.photo_url = params["photo_url"]
      a.bio = params["bio"]
      a.save
    end
    movie.actors<<a
    redirect_to movie_path(movie.id)
  end

  def edit
    the_actor_id = params["id"]
    @movie = Movie.find_by(:id => the_actor_id)
  end

  def update
    the_actor_id = params["id"]
    movie = Movie.find_by(:id => the_movie_id)
    movie.title = params["title"]
    movie.year = params["year"]
    movie.plot = params["plot"]
    movie.director_id = params["director_id"]
    movie.photo_url = params["poster_url"]
    movie.save
    redirect_to actors_url
  end

end