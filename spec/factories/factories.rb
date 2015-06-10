# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence(:name)  { |n| "Post#{n}" }
    sequence(:description)  { |n| "Description#{n}" }
    post_image { File.new(Rails.root.join('app', 'assets', 'images', 'test_image.png')) }
    #http://stackoverflow.com/questions/3294824/how-do-i-use-factory-girl-to-generate-a-paperclip-attachment
  end
end