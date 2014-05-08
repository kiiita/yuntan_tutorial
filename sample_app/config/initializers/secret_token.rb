# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # User the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

# SampleApp::Application.config.secret_key_base = '9b125d55ddffc3fda299373ae21e86949ec3d54324932ea9e91497180f3ba6c1a9f950c449db9c8ef7406edc5e0feb3dbfb0219094455479065c8633cc823da8'
SampleApp::Application.config.secret_key_base = secure_token
