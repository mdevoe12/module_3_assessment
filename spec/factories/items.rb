FactoryGirl.define do
  factory :item do
    sequence :name do |i|
      "Super Happy Item #{i}"
    end

    sequence :description do |i|
      "Description of Awesome #{i}"
    end

    image_url "http://lorempixel.com/400/200/"
  end
end
