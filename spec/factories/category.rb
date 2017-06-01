FactoryGirl.define do
  factory :category do
    title

    factory :category_with_items do
      transient do
        item_count 10
      end

      after(:create) do |category, evaluator|
        create_list(:item, evaluator.item_count, categories: [category])
      end
    end
  end

  sequence :title do |n|
    "category#{n}"
  end
end
