# frozen_string_literal: true

require 'rails_helper'

Rspec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end
end

describe '投稿のテスト' do
  let!(:list) { create(:book,title:'hoge', body:'body') }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面(top_path)に「ここはtopページです」が表示されているか' do
       expect(page).to have_content "ここはtopページです"
      end
      it 'top_pathが"/top"であるか' do
        expect(current_path).to eq('/top')
      end
    end
  end
  describe '投稿画面のテスト' do
    before do
      visit new_list_path 
    end
    context '表示の確認' do
      it 'new_list_pathが"/lists/new"であるか' do
        expect(current_path).to eq('/lists/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '投稿'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
        click_button '投稿'
        expect(page).to have_current_path list_path(List.last)
      end
    end
  end
  desctibe '一覧画面のテスト' do
    before do
      visit lists_path
    end
    context '一覧の表示とリンクの確認' do
      it '一覧画面に投稿されたものが表示されているか' do
        (1..5).each do |i|
          List.create(title: 'hoge'+i.to_s, body: 'body'+i.to_s)
        end
        visit lists_path
        List.all.each_with_index do |list,i|
          j = i * 3
          expect(page).to heve_content list.body
          title_link = find_all('a')[j]
          expect(title_link.narive.inner_text).to match(/list.title/i)
          expect(title_link[:href]).to eq list_path(list)
      end
    end
  end
  
  
  
  
  
end
  