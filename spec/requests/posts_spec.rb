 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/posts", type: :request do
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.

  let(:current_user) { create(:user) }
  let(:mock_post) do 
    post = Post.new(valid_attributes)
    post.user = current_user
    post.save
    post    
  end

  let(:new_post) do 
    post = Post.new valid_attributes
    post
  end


  before do
    sign_in current_user
    # @current_user = User.first_or_create(email: 'cgycgy39@gmail.com', password: "password", password_confirmation: "password")
    # puts "-----#{@current_user}----"
    # allow(@request).to receive(:current_user).and_return(@current_user)
  end
  
  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Test',
      'body' => '12345',
      'user' => current_user
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'title' => '1',
      'body' => '1234'
    }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get post_url(mock_post)

      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_post_url(new_post)

      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_post_url(mock_post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Post" do
        expect {
          post posts_url, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Post" do
        expect {
          post posts_url, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post posts_url, params: { post: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          'id' => '1',
          'title' => 'Test',
          'body' => '12345',
          'user' => current_user
        }    
      }

      it "updates the requested post" do
        patch post_url(mock_post), params: { post: new_attributes }
        mock_post.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the post" do
        patch post_url(mock_post), params: { post: new_attributes }
        mock_post.reload
        expect(response).to redirect_to(post_url(mock_post))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch post_url(mock_post), params: { post: invalid_attributes }
        expect(response).not_to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = mock_post
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      delete post_url(mock_post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
