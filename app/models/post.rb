class Post < ActiveRecord::Base

  has_attached_file :post_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :post_image, :content_type => /\Aimage\/.*\Z/

end
