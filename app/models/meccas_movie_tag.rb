class MeccasMovieTag < ApplicationRecord
	belongs_to :movie_tag #MovieTag:MeccasMovieTag => 1:多
    belongs_to :mecca #Mecca:MeccasMovieTag => 1:多
end
