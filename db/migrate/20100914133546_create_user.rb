class CreateUser < ActiveRecord::Migration
   def self.up
     
    
        add_column :users, :full_name,           :string
        add_column :users, :login,               :string
        add_column :users, :email,               :string
        add_column :users, :crypted_password,    :string
        add_column :users, :password_salt,       :string
        add_column :users, :persistence_token,   :string
        add_column :users, :single_access_token, :string
        add_column :users, :perishable_token,    :string
        add_column :users, :login_count,         :integer, :default => 0
        add_column :users, :failed_login_count,  :integer, :default => 0
        add_column :users, :last_request_at,     :datetime
        add_column :users, :current_login_at,    :datetime
        add_column :users, :last_login_at,       :datetime
        add_column :users, :current_login_ip,    :string
        add_column :users, :last_login_ip,       :string
        add_column :users, :active,              :boolean, :default => false
        
        add_index :users, :perishable_token
        add_index :users, :email
  end

  def self.down
         remove_column :users, :full_name
         remove_column :users, :login
         remove_column :users, :email
         remove_column :users, :crypted_password
         remove_column :users, :password_salt
         remove_column :users, :persistence_token
         remove_column :users, :single_access_token
         remove_column :users, :perishable_token
         remove_column :users, :login_count
         remove_column :users, :failed_login_count
         remove_column :users, :last_request_at
         remove_column :users, :current_login_at
         remove_column :users, :last_login_at
         remove_column :users, :current_login_ip
         remove_column :users, :last_login_ip
         remove_column :users, :active
  end
end
