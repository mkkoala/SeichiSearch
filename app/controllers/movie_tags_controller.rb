class MovieTagsController < ApplicationController

	before_action :authenticate_user!

	def create
		@movie_tag = MovieTag.new(movie_tag_params)
		@movie_tag.user_id = current_user.id
		if @movie_tag.save
			redirect_to movie_tags_path
		else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
			@movie_tags = MovieTag.page(params[:page]).reverse_order
			render 'index'
			@movie_tag = MovieTag.new
			@user = @movie_tag.user
		end
	end

	def index
		@movie_tag = MovieTag.new
		@movie_tags = MovieTag.page(params[:page]).reverse_order
		@user = @movie_tag.user
  	end

  	def show
  		begin #例外処理設定
	    @movie_tag = MovieTag.find(params[:id])
	    @user = @movie_tag.user
		rescue Exception => e #何かしらのエラーが発生したら
			redirect_to root_path #トップページに戻す
			puts "エラーが発生しました！"
		end
  	end

  	def edit
  		begin #例外処理設定
	  	@movie_tag = MovieTag.find(params[:id])
	    if @movie_tag.user.id != current_user.id
	        redirect_to movie_tags_path
	    end
	    rescue Exception => e #何かしらのエラーが発生したら
			redirect_to root_path #トップページに戻す
			puts "エラーが発生しました！"
		end
	  end

	def update
	  	@movie_tag = MovieTag.find(params[:id])
	  	if @movie_tag.update(movie_tag_params)
	  		redirect_to @movie_tag
	  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
	  		render "edit"
	  	end
	end

	def destroy
	  	movie_tag = MovieTag.find(params[:id])
	  	movie_tag.destroy
	  	redirect_to movie_tags_path
	end

  	private
	def movie_tag_params
		params.require(:movie_tag).permit(:title, :movie_image, :body)
	end
end
