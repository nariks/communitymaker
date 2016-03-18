class PagesController < ApplicationController
	skip_before_action	:authenticate_user!, except: :admin
  def admin
  	if current_user.has_role?	:admin
  		@users = User.all
  	else
  		redirect_to root_path
  	end

  end

  def add_admin
  	user = User.find(params[:user_id])
  	user.add_role :admin
  	redirect_to admin_path
  end

  def remove_admin
  	user = User.find(params[:user_id])
  	user.remove_role :admin
  	redirect_to admin_path
  end

  def delete_user
    user = User.find(params[:user_id])
    user.delete
    redirect_to admin_path

  def contact
  end

  def about
  end
end
