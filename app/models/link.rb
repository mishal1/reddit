class Link < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, length: {minimum: 3}
  validates :url, uniqueness: true
end
