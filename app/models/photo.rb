class Photo<ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :comments

  #has_many :commentators, :through => :comments

  scope :of_followees, -> (follows){where followee_id: user_id} 

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
