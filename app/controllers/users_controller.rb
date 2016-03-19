class UsersController < ApplicationController

	def add_admin
		if current_user.has_role? :admin
	  	user = User.find(params[:user_id])
	  	user.add_role :admin
	  	redirect_to admin_path
	  else
	  	
	  end
  end

  def remove_admin
  	if current_user.has_role?	:admin
	  	user = User.find(params[:user_id])
	  	user.remove_role :admin
	  	redirect_to admin_path
	  else
	  	flash[:notice] = "You do not have admin rights?"
	  end

  end

  def delete_user
    if !current_user
	    user = User.find(params[:user_id])
	    user.destroy
	    redirect_to admin_path
	  else
	  	flash[:notice] = "Cannot delete yourself"
	  end
  end

end