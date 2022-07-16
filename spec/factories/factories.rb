FactoryBot.define do
      factory :role do
        name { Role.names.keys.sample }
        to_create do |instance|
            instance.id = Role.find_or_create_by(name: instance.name).id
            instance.reload
        end
    end

    factory :user do
        email { Faker::Internet.email }
        password { Faker::Internet.password }
        password_confirmation { password }
        first_name { Faker::Name.first_name }

        association :role, factory: :role, name: 'student'

        trait :admin do
            association :role, factory: :role, name: 'admin'
        end
    end

    factory :category do
        name { "MyString" }
        user { nil }
    end

    actory :sub_category do
        name { "MyString" }
        catogry { nil }
        user { nil }
    end

    factory :drawer do
        name { "MyString" }
        sub_category { nil }
    end

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


    factory :specification do
        name { "MyString" }
        post { nil }
    end

    factory :box do
        line { "MyString" }
        line1 { "MyString" }
        line2 { "MyString" }
        line3 { "MyString" }
        line4 { "MyString" }
        line5 { "MyString" }
        line6 { "MyString" }
        line7 { "MyString" }
        line8 { "MyString" }
        specification { nil }
        post { nil }
    end

    factory :key_feature do
        line { "MyString" }
        line1 { "MyString" }
        line2 { "MyString" }
        line3 { "MyString" }
        line4 { "MyString" }
        line5 { "MyString" }
        line6 { "MyString" }
        line7 { "MyString" }
        line8 { "MyString" }
        specification { nil }
        post { nil }
    end

    factory :cart do
        user { nil }
    end

    factory :line_item do
        cart { nil }
        post { nil }
        user { nil }
    end


end