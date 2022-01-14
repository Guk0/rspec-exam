require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:current_user) { create(:user) }

  before(:each) do
    @post = assign(:post, Post.create!(
      title: "Title",
      body: "MyText",
      user: current_user,
      views: 0
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/0/)
  end
end
