class AuthorByComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :author, :string
  end

  def self.down
  end
end
