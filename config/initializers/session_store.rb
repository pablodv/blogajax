# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blogajax_session',
  :secret      => '67c19c379beed637e739106577f68c6e99ca800e2e27e3fdb0fd31be67e7bf148ba1f502c256e69c763cccaf794563262cfb045826da3a87b29268237e74e927'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
