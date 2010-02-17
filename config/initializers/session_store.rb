# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_euruko_session',
  :secret => '4801482d5847b9b95dd2b0360ff4fbf6952672c91f618118c8e3f33766b7adc337112cb038bc7f6acb0a935d1ad5f306cc9512411bdcd90d034928582190b283'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
