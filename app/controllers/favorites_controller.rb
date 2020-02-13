class FavoritesController < ApplicationController

    before_action :authenticate_user!

	def create
        mecca = Mecca.find(params[:mecca_id])
        favorite = current_user.favorites.new(mecca_id: mecca.id)
        favorite.save
        redirect_back(fallback_location: root_path)
    end
    def destroy
        mecca = Mecca.find(params[:mecca_id])
        favorite = current_user.favorites.find_by(mecca_id: mecca.id)
        favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
