class MoviesController < ApplicationController

  def index
    @movies = Movie.all.order("title asc")

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render :json => @movies, :except => :id
      end
      format.xml {render xml:@movies}  #also can use the api by this kind style
    end
  end

  def show
    the_movie_id = params["id"]
    @movie = Movie.find_by :id => the_movie_id
  end

  def destroy
    the_movie_id = params["id"]
    m = Movie.find_by(:id => the_movie_id)
    m.destroy
    redirect_to movies_url
  end

  def new
    @director = Director.find_by(:id => params[:director_id])
    @actor = Actor.find_by(:id => params[:actor_id])
  end

  def create
    d = Director.find_by(:id => params[:director_id])
    a = Actor.find_by(:id => params[:actor_id])
    if d
      m = Movie.find_by(:title => params[:title])
      if m
      else
        m = Movie.new
        m.title = params["title"]
        m.year = params["year"]
        m.plot = params["plot"]
        m.duration = params["duration"]
        m.poster_url = params["poster_url"]
        m.official_website = params["official_website"]
        m.save
      end
      d.movies<<m
      redirect_to director_path(d.id)
    elsif a
      m = Movie.find_by(:title => params[:title])
      if m
      else 
        m = Movie.new
        m.title = params["title"]
        m.year = params["year"]
        m.plot = params["plot"]
        m.duration = params["duration"]
        m.poster_url = params["poster_url"]
        m.official_website = params["official_website"]
        m.save
      end
      a.movies<<m
      redirect_to actor_path(a.id)
    end
  end

  def edit
    the_movie_id = params["id"]
    @movie = Movie.find_by(:id => the_movie_id)
  end

  def update
    the_movie_id = params["id"]
    movie = Movie.find_by(:id => the_movie_id)
    movie.title = params["title"]
    movie.year = params["year"]
    movie.plot = params["plot"]
    movie.director_id = params["director_id"]
    movie.photo_url = params["poster_url"]
    movie.save
    redirect_to movies_url
  end

  def todo
    movie = Movie.find_by(:id => params[:movie_id])
    user = User.find_by(:id => session[:user_id])
    user.todoes<<movie.todoes.create()
    redirect_to movie_path(movie.id)
  end

  def done
    movie = Movie.find_by(:id => params[:movie_id])
    user = User.find_by(:id => session[:user_id])
    user.dones<<movie.dones.create()
    user.todoes.each do |todo|
      if todo.todoable_type == "Movie" and todo.todoable_id == movie.id
        todo.destroy
      end
    end
    redirect_to movie_path(movie.id)
  end

end
