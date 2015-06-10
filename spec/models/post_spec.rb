require 'spec_helper'

describe Post do

  before { @post = FactoryGirl.create(:post) }

  subject { @post }


  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:post_image) }

  it { should be_valid }

  describe "when name is not present" do
    before { @post.name = " " }
    it { should_not be_valid }
  end

  describe "when description is not present" do
    before { @post.description = " " }
    it { should_not be_valid }
  end

  describe "when name is too long (greater than 100 characters)" do
    before { @post.name = "a" * 101 }
    it { should_not be_valid }
  end

  describe "when description is too long (greater than 300 characters)" do
    before { @post.description = "a" * 301 }
    it { should_not be_valid }
  end


  it { should validate_attachment_content_type(:post_image).
                  allowing('image/png', 'image/jpg', 'image/jpeg', 'image/gif').
                  rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:post_image).
                  less_than(5.megabytes) }


end
