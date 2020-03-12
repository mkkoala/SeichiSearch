class MeccaCommentsController < ApplicationController

	before_action :authenticate_user!

	def create
	    mecca = Mecca.find(params[:mecca_id])
	    comment = current_user.mecca_comments.new(mecca_comment_params)
	    comment.mecca_id = mecca.id
	    comment.save
	    redirect_to mecca_path(mecca.id)
	    # if comment.save
	    # 	redirect_back(fallback_location: root_path) #そのままのページへ飛ぶ
	    # else
	    # 	redirect_to mecca_path(mecca.id)
	    # end
	end

	def destroy
	  	mecca = Mecca.find(params[:mecca_id])
        # comment = current_user.mecca_comments.find_by(id: params[:comment_id], mecca_id: mecca.id)
        comment = mecca.mecca_comments.find(params[:id])
        comment.destroy
        redirect_to mecca_path(mecca.id)
        # redirect_back(fallback_location: root_path) #そのままのページへ飛ぶ
  	end

	private
	def mecca_comment_params
	    params.require(:mecca_comment).permit(:user_id,:mecca_id,:comment)
	end
end
