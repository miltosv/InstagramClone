class Comment < ActiveRecord::Base
  belongs_to :photo
  #belongs_to :commentator, foreign_key:'user_id', class_name: 'User'
  belongs_to :user
end
