require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create(email: 'cgycgy39@gmail.com', password: "password", password_confirmation: "password")
  it 'has a title' do
    post = Post.new(
      title: "",
      body: "a valid body",
      user: current_user,
      views: 0
    )
    # this test will be fail
    expect(post).to_not be_valid
    post.title = "Has a title"
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: "a valid title",
      body: "",
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "Has a body"
    expect(post).to be_valid
  end

  it 'has a title at least 2 characters long' do
    post = Post.new(
      title: "",
      body: "a valid body",
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.title = "12"
    expect(post).to be_valid
  end

  it 'has a body between 5 and 100 characters' do
    post = Post.new(
      title: "a valid title",
      body: "",
      user: current_user,
      views: 0
    )

    expect(post).to_not be_valid
    post.body = "12345"
    expect(post).to be_valid
    post.body = "Eqla1Ou-gPS-3dzSopFQAqb4yKyKFbxnjT-0nHsF6btuX_KY436VWgMLQcWjMCIEIws3AC2nEno8F7_M1y22ORKHPBAYpmNwg_D8RRQ95J4FGOy9lws85j6kHIPsaEbUWwxDNQU"
    expect(post).to_not be_valid
  end

  it 'has numerical views' do
    post = Post.new(
      title: "a valid title",
      body: "a valid body",
      user: current_user,
      views: 0
    )

    expect(post.views).to be_a(Integer)

  end

end
