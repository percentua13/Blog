class Post2tag < ApplicationRecord
  belongs_to :tag
  belongs_to :post
end
