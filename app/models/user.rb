class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }

  has_many :articles, foreign_key: :author_id
  has_many :votes
end
