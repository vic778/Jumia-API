FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyText" }
    model { "MyString" }
    price { 1.5 }
    connexion { "MyString" }
    cpu { "MyString" }
    gpu { "MyString" }
    system { "MyString" }
    battery { "MyString" }
    camera { "MyString" }
    memory { "MyString" }
    display { "MyString" }
    card_sim { "MyString" }
    image { "MyString" }
    drawer { nil }
  end
end
