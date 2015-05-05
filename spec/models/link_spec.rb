require 'spec_helper'

describe Link, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid with a title of less than three characters' do
    link = Link.new(title: "ab")
    expect(link).to have(1).error_on(:title)
    expect(link).not_to be_valid
  end

end