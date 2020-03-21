class UsersController < ApplicationController

	before_action :authenticate_user!

	def index
		@users = User.all
	end

	def show
		begin #例外処理設定
			@user = User.find(params[:id])
	    	@meccas = @user.meccas.page(params[:page]).reverse_order
	    	@movie_tags = @user.movie_tags.page(params[:page]).reverse_order
	    	@favorites = @user.favorites.page(params[:page]).reverse_order
		rescue Exception => e #何かしらのエラーが発生したら
			redirect_to root_path #トップページに戻す
			puts "エラーが発生しました！"
		end
	end

	def edit
		begin #例外処理設定
		@user = User.find(params[:id])
		rescue Exception => e #何かしらのエラーが発生したら
			redirect_to root_path #トップページに戻す
			puts "エラーが発生しました！"
		end
	end

	def update
		@user = User.find(params[:id])
	    if @user.update(user_params)
	      redirect_to user_path(@user.id)
	    else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
	      render 'edit'
	    end
	end

	private
    def user_params
       params.require(:user).permit(:name, :profile_image)
    end
end
