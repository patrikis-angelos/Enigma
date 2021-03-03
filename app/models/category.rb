class Category < ApplicationRecord
  validates :name, presence: true
  has_many :article_categories
  has_many :articles, through: :article_categories
end
