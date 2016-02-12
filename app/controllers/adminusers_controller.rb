class AdminusersController < ApplicationController

    before_action :confirm_logged_in

	def index
		#@admin_users = AdminUser.sorted
		@admin_users = AdminUser.paginate(:page => params[:page])
	end

	def new
		@admin_user = AdminUser.new
	end

	def create
		@admin_user = AdminUser.new(admin_user_params)
		 if @admin_user.save
		 	UserMailer.welcome_email(@admin_user).deliver
		 	flash[:notice] = "adminuser created successfully"
           	   redirect_to :action => :index
           	 else
           	 	render 'new'
         end
	end
  
	def edit
		@admin_user = AdminUser.find(params[:id])
	end

	def update
		 @admin_user = AdminUser.find(params[:id])
          @admin_user.update_attributes(admin_user_params)
           if @admin_user.save
           	  flash[:notice] = "adminuser updated successfully"
           	   redirect_to :action => :index
           	 else
           	 	render 'edit'
           	end
    end

	def delete
	 @admin_user = AdminUser.find(params[:id])
       @admin_user.destroy
      flash[:notice] ="admin_user '#{@admin_user.name}' deleted successfully"
      redirect_to :action => :index
	end

	private

	def admin_user_params
		params.require(:admin_user).permit(:first_name,:last_name,:email,:password,:username)
     end

end
