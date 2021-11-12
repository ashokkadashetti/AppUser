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
		@users=User.find(params[:id])
		

	end

#...........................................................

	def create
		@users=User.new(user_params)

		respond_to do |format|



			if @users.save
				format.html{ redirect_to users_path, notice: "User was successfully created." }
				#format.json { render :show, status: :created, location: @user }
			else
        		format.html { render :new}
        		#format.json { render json: @user.errors, status: :unprocessable_entity }, status: :unprocessable_entity 
			end
		end	
	end


#...........................................................

	def edit
		@user=User.find(params[:id])

	end

#...........................................................

  	def update
  		@user=User.find(params[:id])

    	respond_to do |format|
    		@user.posts.destroy
      		if @user.update(user_params)
        		@user.save
        		format.html { redirect_to users_path, notice: "Successfully Updated."}
      		else
        		format.html { render :edit}
      		end
    	end
  	end

#...........................................................

  	def destroy
  		@user=User.find(params[:id])
    	@user.destroy
    	respond_to do |format|
      		format.html { redirect_to users_path, notice: "Successfully Deteted."}
    	end
  	end


#...........................................................

	def user_params
		params.require(:user).permit(:name, :email, posts_attributes: [:id, :description])
	end



end


