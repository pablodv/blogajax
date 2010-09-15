class Post < ActiveRecord::Base
  has_many :comments

  validates_presence_of :title, :body, :category_id

  named_scope :recent, :conditions => ["created_at > ?", 2.day.ago], :order => 'created_at DESC'
end
