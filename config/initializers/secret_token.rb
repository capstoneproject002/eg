# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
def find_secure_token
  token_file = Rails.root.join('.secret')
  if File.exist? token_file
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token of 64 random hexadecimal characters and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Eg::Application.config.secret_key_base = "c712276745574e9e0f059d8dcdb59121e4f1f33ee0615db6b9c5ee41b1b8ea4703362a5ce31b0ad18f3b8d178fe35107211d2f4f51720b9527f235c68e0ae847"