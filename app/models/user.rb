class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, through: :likes, source: :tweet
  has_one_attached :avatar

  validates :username, uniqueness: { case_sensitive: false}, allow_blank: true

  before_save :set_display_name, if: -> {username.present? && display_name.blank?}
  def set_display_name
    self.display_name = username.humanize
  end
end
