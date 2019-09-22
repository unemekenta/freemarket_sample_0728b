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

  describe 'GET #mypage' do
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

  describe 'GET #notification' do
    context 'log in' do
      before do
        login user
        get :notification, params: { id: user.id }
      end

      it 'redners notification' do
        expect(response).to render_template :notification
      end
    end
  end
  describe 'GET #todo' do
    context 'log in' do
      before do
        login user
        get :todo, params: { id: user.id }
      end

      it 'redners notification' do
        expect(response).to render_template :todo
      end
    end
  end

  describe 'GET #like' do
    context 'log in' do
      before do
        login user
        get :like, params: { id: user.id }
      end

      it 'redners like' do
        expect(response).to render_template :like
      end
    end
  end

  describe 'GET #forsell' do
    context 'log in' do
      before do
        login user
        get :forsell, params: { id: user.id }
      end

      it 'redners forsell' do
        expect(response).to render_template :forsell
      end
    end
  end

  describe 'GET #in_progress' do
    context 'log in' do
      before do
        login user
        get :in_progress, params: { id: user.id }
      end

      it 'redners in_progress' do
        expect(response).to render_template :in_progress
      end
    end
  end

  describe 'GET #in_progress' do
    context 'log in' do
      before do
        login user
        get :in_progress, params: { id: user.id }
      end

      it 'redners in_progress' do
        expect(response).to render_template :in_progress
      end
    end
  end

  describe 'GET #completed' do
    context 'log in' do
      before do
        login user
        get :completed, params: { id: user.id }
      end

      it 'redners completed' do
        expect(response).to render_template :completed
      end
    end
  end

  describe 'GET #logout' do
    context 'log in' do
      before do
        login user
        get :logout, params: { id: user.id }
      end

      it 'redners logout' do
        expect(response).to render_template :logout
      end
    end
  end

  describe 'GET #identification' do
    context 'log in' do
      before do
        login user
        get :identification, params: { id: user.id }
      end

      it 'redners identification' do
        expect(response).to render_template :identification
      end
    end
  end

  describe 'GET #profile' do
    context 'log in' do
      before do
        login user
        get :profile, params: { id: user.id }
      end

      it 'redners profile' do
        expect(response).to render_template :profile
      end
    end
  end
end