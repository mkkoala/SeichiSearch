class MeccaCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
	    mecca = Mecca.find(params[:mecca_id])
	    comment = current_user.mecca_comments.new(mecca_comment_params)
	    comment.mecca_id = mecca.id
	    if comment.save
	    	redirect_back(fallback_location: root_path)
	    else
	    	redirect_to mecca_path(mecca.id)
	    end
	end

	def destroy
	  	mecca = Mecca.find(params[:mecca_id])
        comment = current_user.mecca_comments.find_by(mecca_id: mecca.id)
        comment.destroy
        redirect_back(fallback_location: root_path)
  	end

	private
	def mecca_comment_params
	    params.require(:mecca_comment).permit(:user_id,:mecca_id,:comment)
	end
end
