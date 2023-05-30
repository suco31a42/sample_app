# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, "モデルのテスト", type: :model do
  desctibe '実際に保存してみる' do
    it '有効な投稿内容の場合は保存されるか' do
    expect(FactoryBot.build(:list)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合バリデーションチェックされ空白のエラーメッセージが帰ってきてるか" do
      list = List.new(title: '', body: 'hoge')
      expect(list).to be_invelid
      expect(list.errors[:title]).to include("can't be blank")
    end
    it "bodyeが空白の場合バリデーションチェックされ空白のエラーメッセージが帰ってきてるか" do
      list = List.new(title: 'hoge', body: '')
      expect(list).to be_invalid
      expect(list.errors[:body]).to include("con't be blank")
    end
  end
end
  