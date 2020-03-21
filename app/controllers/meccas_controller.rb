class MeccasController < ApplicationController


	before_action :authenticate_user!

	def new
		@mecca = Mecca.new
		@mecca.meccas_movie_tags.build
	end

	def create
		@mecca = Mecca.new(mecca_params)
		@mecca.user_id = current_user.id
		if @mecca.save
			tags = Vision.get_image_data(@mecca.mecca_image)
	    	tags.each do |tag|
	        	@mecca.tags.create(name: tag)
	    	end
			redirect_to meccas_path(@mecca)
		else #if文でエラー発生時と正常時のリンク先を分けている。
			render 'new'
		end
	end

	def index
		@meccas = Mecca.page(params[:page]).reverse_order
		@movie_tags = MovieTag.all
		if params[:movie_tag_id] # urlにmovie_tag_id(params)がある場合
		  @movie_tag = MovieTag.find(params[:movie_tag_id])# movie_tagのデータベースのテーブルから一致するidを取得
		  # movie_tag_idと紐づく投稿を取得
	      @meccas = Mecca.joins(:meccas_movie_tags).where("meccas_movie_tags.movie_tag_id=?",params[:movie_tag_id]).order(created_at: :asc).page(params[:page]).per(15).reverse_order
	    else # urlにmovie_tag_id(params)がない場合
	      # 投稿すべてを取得
	      @meccas = Mecca.order(created_at: :asc).page(params[:page]).per(15).reverse_order
	    end
	end

  	def show
  		begin #例外処理設定
	    @mecca = Mecca.find(params[:id])
	    @mecca_comment = MeccaComment.new
	    @user = @mecca.user
		rescue Exception => e #何かしらのエラーが発生したら
			redirect_to root_path #トップページに戻す
			puts "エラーが発生しました！"
		end
  	end

  	def edit
  		begin #例外処理設定
	  	@mecca = Mecca.find(params[:id])
	    if @mecca.user.id != current_user.id
	        redirect_to meccas_path
	    end
	    rescue Exception => e #何かしらのエラーが発生したら
			redirect_to root_path #トップページに戻す
			puts "エラーが発生しました！"
		end
	end

	def update
	  	@mecca = Mecca.find(params[:id])
	  	if @mecca.update(mecca_params)
	  		redirect_to @mecca
	  	else #if文でエラー発生時と正常時のリンク先を分けている。
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
