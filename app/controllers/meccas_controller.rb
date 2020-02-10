class MeccasController < ApplicationController

	def new
		@mecca = Mecca.new
		@mecca.meccas_movie_tags.build
	end

	def create
		@mecca = Mecca.new(mecca_params)
		@mecca.user_id = current_user.id
		if @mecca.save
			redirect_to meccas_path
		else
			render 'new'
		end
	end

	def index
		@meccas = Mecca.page(params[:page]).reverse_order
		@meccas_movie_tags = MeccasMovieTag.all
		if params[:movie_tag_id] # urlにmeccas_movie_tag_id(params)がある場合
		  @movie_tag = MovieTag.find(params[:movie_tag_id])
		  # meccas_movie_tagのデータベースのテーブルから一致するidを取得
	      # meccas_movie_tag_idと紐づく投稿を取得
	      @meccas = Mecca.joins(:meccas_movie_tags).where("meccas_movie_tags.movie_tag_id=?",params[:movie_tag_id]).order(created_at: :asc).page(params[:page]).reverse_order
	      p @meccas
	    else # urlにmeccas_movie_tag_id(params)がない場合
	      # 投稿すべてを取得
	      @meccas = Mecca.order(created_at: :asc).page(params[:page]).reverse_order
	    end
	end

  	def show
	    @mecca = Mecca.find(params[:id])
	    @mecca_comment = MeccaComment.new
	    @user = @mecca.user
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
		params.require(:mecca).permit(:name, :mecca_image, :body, :post_code, :address, { :movie_tag_ids=> [] })
	end

end
