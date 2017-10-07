class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  # like toggle method
  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end

  # liked_bookmarks
  def liked_bookmarks
    # likes.map(&:bookmark)
    likes.includes(bookmark: :topic).map(&:bookmark)
  end

end
