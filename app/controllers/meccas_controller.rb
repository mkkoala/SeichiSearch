class MeccasController < ApplicationController

	def new
		@mecca = Mecca.new
	end

	def create
		@mecca = Mecca.new(mecca_params)
		@mecca.user_id = current_user.id
		@mecca.save
		redirect_to meccas_path
	end

	def index
		@meccas = Mecca.page(params[:page]).reverse_order
  	end

  	def show
	    @mecca = Mecca.find(params[:id])
	    @mecca_comment = MeccaComment.new
	    @user = @mecca.user
	    @movie_tags = @mecca.meccas_movie_tags.movie_tags.page(params[:page]).reverse_order
  	end

  	def edit
	  	@mecca = Mecca.find(params[:id])
	    if @mecca.user.id != current_user.id
	        redirect_to meccas_path
	    end
	  end

	def update
	  	@mecca = Mecca.find(params[:id])
	  	if @mecca.update(mecca_params)
	  		redirect_to @mecca
	  	else #if文でエラー発生時と正常時のリンク先を枝分かれにしている。
	  		render "edit"
	  	end
	end

	def destroy
	  	mecca = Mecca.find(params[:id])
	  	mecca.destroy
	  	redirect_to meccas_path
	end

  	private
	def mecca_params
		params.require(:mecca).permit(:name, :mecca_image, :body, :post_code, :address)
	end

end
