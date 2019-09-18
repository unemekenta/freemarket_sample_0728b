require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { create(:user) }
  
  describe 'GET #step1' do
  #ログインしていない時、新規登録ボタンを押すと新規登録ページにとべる
    context 'sign up' do
      before do
        get :step1
      end

      it 'redners step1' do
        expect(response).to render_template :step1
      end
    end
  end

  describe '#mypage' do

  #ログインできている時、マイページボタンを押すとマイページにとべる
    context 'log in' do
      before do
        login user
        get :mypage, params: { id: user.id }
      end

      it 'redners mypage' do
        expect(response).to render_template :mypage
      end
    end
  end
end