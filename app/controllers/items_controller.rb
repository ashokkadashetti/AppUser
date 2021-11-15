class ItemsController < ApplicationController


	def edit
		@user=User.find(params[:id])
		#1.times {@user.posts.build}
		
	end

#................................................................

	def update
  		@user=User.find(params[:id])

    	respond_to do |format|
      		if @user.update(post_params)
        		format.html { redirect_to users_path}
      		else
        		format.html { render :edit}
      		end
    	end
  	end

 #................................................................

 	def post_params
 		params.require(:user).permit(:name, :email, posts_attributes: [:id, :description])
 	end



end
