class PostsController < ApplicationController


	def index

	end

#................................................................

	def show
		@user=User.friendly.find(params[:id])
	end


#................................................................

	def edit
		@user=User.friendly.find(params[:id])
		1.times {@user.posts.build}
		
	end

#................................................................

	def update
  		@user=User.friendly.find(params[:id])

    	respond_to do |format|
      		if @user.update(post_params)
        		format.html { redirect_to users_path,
        			notice:"Created successfully"}
      		else
        		format.html { render :edit}
      		end
    	end
  	end

 #................................................................
 	private 
 	
 	def post_params
 		params.require(:user).permit(:name,
 									 :email,
 									 posts_attributes: [:id, :description]
 									 )
 	end

 #.................................................................................................


end
