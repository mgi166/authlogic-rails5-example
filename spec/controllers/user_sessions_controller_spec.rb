require 'rails_helper'

RSpec.describe UserSessionsController, :type => :controller do
  let(:valid_params) { { user_session: { username: user.username, password: 'password' } } }
  let(:user) { create :user }

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    context 'given valid params' do
      it do
        post :create, params: valid_params
        expect(response).to redirect_to users_path
      end
    end

    context 'given invalid params' do
      let(:invalid_params) do
        valid_params[:user_session].update(username: 'bad user')
        valid_params
      end

      it do
        post :create, params: invalid_params
        expect(response).to render_template :new
      end
    end
  end

  describe "DELETE destroy" do
    context 'when user logged in' do
      before { login user }

      it do
        delete :destroy
        expect(response).to redirect_to login_path
      end
    end

    context 'when user does not logged in' do
      it do
        delete :destroy
        expect(response).to redirect_to login_path
      end
    end
  end

end
