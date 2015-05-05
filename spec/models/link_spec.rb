require 'spec_helper'

describe Link, type: :model do
  it { is_expected.to have_many :comments }
end