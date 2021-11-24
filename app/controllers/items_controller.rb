class ItemsController < ApplicationController


	def show
		@user=User.friendly.find(params[:id])
	end

#...............................................................

	def edit
		@user=User.friendly.find(params[:id])
		#1.times {@user.posts.build}
		
	end

#................................................................

	def update
  		@user=User.friendly.find(params[:id])

    	respond_to do |format|
      		if @user.update(item_params)
        		format.html { redirect_to users_path,
        			notice:"Updated successfully"}
      		else
        		format.html { render :edit}
      		end
    	end
  	end

 #................................................................

 def destroy
 	@user=User.posts.friendly.find(params[:id])
 	#@post=@user.posts.find(params[:id])

 	@user.destroy
 	respond_to do |format|
 		format.html{ redirect_to users_path}
 	end
 end

 	def item_params
 		params.require(:user).permit(:name,
 									 :email,
 									 posts_attributes: [:id, :description, :_destroy]
 									 )
 	end



end
