FactoryBot.define do
  factory :user_domain do
    post_number { '000-3434' }
    town { '横浜市緑区' }
    number { '青山1-1-1' }
    build {'柳ビル103'}
    photo_number { '01205005000' }
    prefecture_id { 2 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
