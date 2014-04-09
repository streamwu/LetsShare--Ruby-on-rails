class DirectorsController < ApplicationController
	def index
    @directors = Director.all.order("name asc")

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render :json => @director, :except => :id
      end
      format.xml {render xml:@director}  #also can use the api by this kind style
    end
  end

  def show
    the_director_id = params["id"]
    @director = Director.find_by :id => the_director_id
  end

  def destroy
    the_director_id = params["id"]
    d = Director.find_by(:id => the_director_id)
    d.destroy
    redirect_to director_url
  end

  def new
  end

  def create
  	d = Director.new
    d.name = params["name"]
    d.birthdate = params["birthdate"]
    d.gender = params["gender"]
    d.country = params["country"]
    d.photo_url = params["photo_url"]
    d.bio = params["bio"]
 
 	  d.save
    redirect_to director_path(d.id)
  end

  def edit
    the_director_id = params["id"]
    @movie = Movie.find_by(:id => the_director_id)
  end

  def update
    the_director_id = params["id"]
    movie = Movie.find_by(:id => the_movie_id)
    movie.title = params["title"]
    movie.year = params["year"]
    movie.plot = params["plot"]
    movie.director_id = params["director_id"]
    movie.photo_url = params["photo_url"]
    movie.save
    redirect_to director_url
  end

end
