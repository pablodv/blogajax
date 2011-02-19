class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :category

  validates_presence_of :title, :body, :category_id

  named_scope :recent, :conditions => ["created_at > ?", 7.day.ago], :order => 'created_at DESC'
end
