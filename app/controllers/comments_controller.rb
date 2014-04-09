class CommentsController < ApplicationController

  def show
    the_comment_id = params["id"]
    @comment = Comment.find_by :id => the_comment_id
  end

  def destroy
    the_comment_id = params["id"]
    c = Comment.find_by(:id => the_comment_id)
    c.destroy
    redirect_to comments_url
  end

  def new
    @movie = Movie.find_by(:id => params[:movie_id])
    @group = Group.find_by(:id => params[:group_id])
  end

  def create
    m = Movie.find_by(:id => params[:movie_id])
    g = Group.find_by(:id => params[:group_id])
    c = Comment.new
    c.title = params["title"]
    c.content = params["content"]
    c.user_id = session[:user_id]
    c.save
    if m
      m.comments<<c
      redirect_to movie_path(m.id)
    elsif g
      g.comments<<c
      redirect_to group_path(g.id)
    end
  end

end
