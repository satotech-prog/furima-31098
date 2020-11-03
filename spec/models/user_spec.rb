require 'rails_helper'

RSpec.describe User, type: :model do
 describe '#create' do
  before do
    @user = FactoryBot.build(:user)
  end

it "全ての項目の入力が存在すれば登録できること" do
  expect(@user).to be_valid
end

it "nicknameが空では登録できないこと" do
  @user.nickname = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Nickname can't be blank")
end

it "emailが空では登録できないこと" do
  @user.email = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Email can't be blank")
end

it "passwordが空では登録できないこと" do
  @user.password = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Password can't be blank")
end

it "password_confirmationが空では登録できないこと" do
  @user.password_confirmation = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
end

it "lastnameが空では登録できないこと" do
  @user.lastname = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Lastname can't be blank")
end

it "firstnameが空では登録できないこと" do
  @user.firstname = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Firstname can't be blank")
end

it "lastname_kanaが空では登録できないこと" do
  @user.lastname_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
end

it "firstname_kanaが空では登録できないこと" do
  @user.firstname_kana = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
end

it "birthdayが空では登録できないこと" do
  @user.birthday = ""
  @user.valid?
  expect(@user.errors.full_messages).to include("Birthday can't be blank")
end

it "重複したemailが存在する場合登録できない" do
  @user.save
  another_user = FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include("Email has already been taken")
end

it "passwordが6文字以上なら登録できる" do
  @user.password = "000000"
  @user.password_confirmation = "000000"
  expect(@user).to be_valid
end


end
end
