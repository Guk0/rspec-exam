require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:current_user) { create(:user) }
  let(:post) { build(:post, title: "", body: "") }
  subject { post }

  it 'has a title' do
    post.title = ""
    post.body = "a valid body"
    # this test will be fail
    is_expected.to_not be_valid
    post.title = "Has a title"
    is_expected.to be_valid
  end

  it 'has a body' do
    post.title = "a valid title"
    post.body = ""

    is_expected.to_not be_valid
    post.body = "Has a body"
    is_expected.to be_valid
  end

  it 'has a title at least 2 characters long' do
    post.title = ""
    post.body = "a valid body"

    is_expected.to_not be_valid
    post.title = "12"
    is_expected.to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post.title = "a valid title"
    post.body = ""
    
    is_expected.to_not be_valid
    post.body = "12345"
    is_expected.to be_valid
    post.body = "Eqla1Ou-gPS-3dzSopFQAqb4yKyKFbxnjT-0nHsF6btuX_KY436VWgMLQcWjMCIEIws3AC2nEno8F7_M1y22ORKHPBAYpmNwg_D8RRQ95J4FGOy9lws85j6kHIPsaEbUWwxDNQU"
    is_expected.to_not be_valid
  end

  it 'has numerical views' do
    post.title = "a valid title"
    post.body = "a valid body"

    expect(post.views).to be_a(Integer)

  end

end
