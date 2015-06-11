class Post < ActiveRecord::Base

  include FriendlyId
  friendly_id :slug_candidates, use: :history

  def slug_candidates
    [
        :name,
        [:name, :id]
    ]
  end

  def should_generate_new_friendly_id?
    name_changed? || super
  end


  default_scope { order('created_at DESC') } #order posts in order of creation with the most recent post appearing first

  has_attached_file :post_image, :default_url => "/images/:style/missing.png"

  validates_attachment :post_image,
                       :content_type => { :content_type => ["image/jpeg", "image/jpg", "image/gif", "image/png"] },
                       :size => { :less_than => 5.megabytes }
                       #:presence => true

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: {message: "There is already a Post with this name"}
  validates :description, presence: true, length: { maximum: 300 }

end
