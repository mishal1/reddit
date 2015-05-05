class Comment < ActiveRecord::Base
  belongs_to :link
  validates :rating, inclusion: (1..5)
end
