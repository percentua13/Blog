class Post < ApplicationRecord
  belongs_to :author
  has_many :comments
  has_many :post2tags
end
