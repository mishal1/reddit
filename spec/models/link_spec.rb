require 'spec_helper'

describe Link, type: :model do
  it { is_expected.to have_many :comments }

  it 'deletes comment that belongs to the deleted link' do
    @link = Link.create(title: 'something', id: 1)
    @comment = Comment.create(link_id: @link.id)
    expect(Comment.all.length).to eq 1
    @link.destroy!
    expect(Comment.all.length).to eq 0
  end
end