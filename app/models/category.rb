class Category < ActiveRecord::Base
  has_many :posts

  named_scope :recent, :conditions => ["created_at > ?", 7.day.ago], :order => 'created_at DESC'
end
