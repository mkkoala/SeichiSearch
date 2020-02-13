class MovieTag < ApplicationRecord

	belongs_to :user #User:MovieTag => 1:多

	has_many :meccas_movie_tags, dependent: :destroy #MovieTag:MeccasMovieTag => 1:多
	has_many :meccas, through: :meccas_movie_tags #MovieTag:MeccasMovieTag => 1:多

	attachment :movie_image

	validates :title, presence: true
	validates :movie_image, presence: true
	validates :body, presence: true
end
