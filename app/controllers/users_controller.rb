class UsersController < ApplicationController


	def index
		@users=User.all
	end

#...........................................................

	def new
		@users=User.new
		@users.posts.build(
			:description => "Nothing")
	end

#...........................................................

	def show
		@users=User.friendly.find(params[:id])
	end

#...........................................................

	def create
		@users=User.new(user_params)

		respond_to do |format|

			if @users.save
				format.html{ redirect_to users_path,
					notice: "User was successfully created."}
			else
        		format.html { render :new}
			end
		end	
	end


#...........................................................

	def edit
		@users=User.friendly.find(params[:id])
	end

#...........................................................

  	def update
  		@users=User.friendly.find(params[:id])

    	respond_to do |format|
    		@users.posts.destroy
      		if @users.update(user_params)
        		@users.save
        		format.html { redirect_to users_path,
        			notice: "Successfully Updated."}
      		else
        		format.html { render :edit}
      		end
    	end
  	end

#...........................................................

  	def destroy
  		@user=User.friendly.find(params[:id])
    	@user.destroy
    	respond_to do |format|
      		format.html { redirect_to users_path,
      			notice: "Successfully Deteted."}
    	end
  	end


#...........................................................

	def user_params
		params.require(:user).permit(:name,
									 :email,
									 :password,
									 posts_attributes: [:id, :description]
									 )
	end

#.........................................................................................

end