class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :sound
  validates :body, length: { maximum: 140 }, presence: true || :sound_url, presence: true
end
