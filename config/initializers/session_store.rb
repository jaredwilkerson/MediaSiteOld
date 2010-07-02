# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_MediaSite_session',
  :secret      => '1feed583337a89f899a6d70509c0cf1b121e9cd70c4fd0924c45e3a9121a85897da5c1162f3a49ef5950a8f64b2e0080009a339d703560cac9a309dd774e43c3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
