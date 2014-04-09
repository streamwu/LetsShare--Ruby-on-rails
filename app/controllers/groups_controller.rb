class GroupsController < ApplicationController
	def index
	  @groups = Group.all
	  @user = User.find_by_id(session[:user_id])
	end

	def show
		@group = Group.find_by_id(params["id"])
	end

	def new
		
	end

	def create
		#create the group
		g = Group.new
		g.user_id = session[:user_id]
		g.title = params["title"]
		g.description = params["description"]
		g.photo_url = params["photo_url"]
		
        g.save      

		redirect_to group_url(g.id)
	end

	def edit
		@group = Group.find_by_id(params[:id])
	end

	def update
		g = Group.find_by_id(params[:id])
		g.title = params["title"]
		g.description = params["description"]
		g.photo_url = params["photo_url"]
		g.save

		redirect_to group_url(g.id)
	end

	def destroy
		g = Group.find_by_id(params[:id])
		g.users.clear
        g.destroy

        redirect_to groups_url
	end

    def join
        g = Group.find_by_id(params[:group_id])
        g.users << User.find_by_id(session[:user_id])

        redirect_to group_url(g.id)
    end

    def drop
    	g = Group.find_by_id(params[:group_id])
    	g.users.delete(session[:user_id])

    	redirect_to group_url(g.id)
    end

end
