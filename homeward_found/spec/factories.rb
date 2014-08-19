FactoryGirl.define do

  factory :losting do
    # You don't need to use blocks.  Simple strings work.  This thing
    # telegraphs to me you didn't read the docs.  Don't tip your hand like
    # that.  There **are** legitimate times to use a block in FG, but not here.
    pet_name { "fido" }
    animal_type { "dog" }
    size { "medium" }
    breed { "retriever" }
    coat_color { "golden" }
    coat_length { "medium" }
  end

  factory :sighting do
    animal_type { "cat" }
    size { "small" }
    breed { "tabby" }
    coat_color { "calico" }
    coat_length { "short" }
  end

  factory :user do
    email { Faker::Internet.free_email }
    password { "123456" }

    factory :user_with_losting do
      after(:create) do |user|
        create_list(:losting, 1, user: user)
      end
    end

    factory :user_with_sighting do
      after(:create) do |user|
        create_list(:sighting, 1, user: user)
      end
    end
  end
end
