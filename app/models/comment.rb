class Comment < ActiveRecord::Base
  attr_accessible :user_id, :request_id, :body

  validates_presence_of :user, :request, :body

  belongs_to  :user,
              :inverse_of => :comments

  belongs_to  :request,
              :inverse_of => :comments

end
