class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy #User:Favorite => 1:多
  def favorited_by?(mecca)
      favorites.where(mecca_id: mecca.id).exists?
  end

  has_many :mecca_comments, dependent: :destroy #User:MeccaComment => 1:多
  has_many :meccas, dependent: :destroy #User:Mecca => 1:多
  has_many :movie_tags, dependent: :destroy #User:MovieTag => 1:多

  attachment :profile_image

  validates :name, presence: true

end
