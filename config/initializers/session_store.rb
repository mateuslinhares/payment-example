# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_spyke_session',
  :secret      => 'de5dba64284e15f2794a1a2dde49cfc842c65c8cc1899d4584c2db88e42b684ac91a405c71ecd77ca11d49d789e3b60b54e6bd33bd3a05c208eeb455282e9cea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
