require 'rails_helper'

describe Comment, type: :model do

  it 'deletes comment that belongs to the deleted link' do
    @link = Link.create(title: 'something', id: 1)
    @comment = Comment.create(link_id: @link.id, rating: 1)
    expect(Comment.all.length).to eq 1
    @link.destroy!
    expect(Comment.all.length).to eq 0
  end

  it "is invalid if the rating is more than 5" do
    comment = Comment.new(rating: 10)
    expect(comment).to have(1).error_on(:rating)
  end

end