class Mecca < ApplicationRecord
	belongs_to :user #User:Mecca => 1:多

	has_many :favorites, dependent: :destroy #Mecca:Favorite => 1:多
	def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end

	has_many :mecca_comments, dependent: :destroy #Mecca:MeccaComment => 1:多

	has_many :meccas_movie_tags, dependent: :destroy #Mecca:MeccasMovieTag => 1:多
	has_many :movie_tags, through: :meccas_movie_tags #Mecca:MeccasMovieTag => 1:多

	attachment :mecca_image

	validates :name, presence: true
	validates :body, presence: true
	validates :mecca_image_id, presence: true
	validates :address, presence: true
	validates :post_code, presence: true, format: {with: /\A\d{7}\z/}
	validates :movie_tag_ids, presence: true
end
