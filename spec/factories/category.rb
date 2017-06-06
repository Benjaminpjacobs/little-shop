FactoryGirl.define do
  sequence :title do |n|
    "Category#{n}"
  end

  factory :category do
    # title {generate(:title)}
    title {generate(:title)}

    factory :category_with_items do
      transient do
        item_count 10
      end

      after(:create) do |category, evaluator|
        category.items << create_list(:item, evaluator.item_count)
      end
    end
  end

  # sequence :title do
  #   gen = "category_#{rand(1000).to_s}"
  #   while Category.where(title:gen).exists?
  #     gen = "category_#{rand(1000).to_s}"
  #   end
  #   gen
  # end
end
