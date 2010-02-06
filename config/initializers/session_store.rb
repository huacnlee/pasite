# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pastie_session',
  :secret      => 'a334da8bf718558ef92fd618ee4b1064fd0317fe3ee33273bf8fa29af66165b5e0a65ec8fb2cddbcd4714cf97cd3fbf4c0992cf8d5ffbc21d2635696aa8898cf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
