# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#Note if you dont update this you're compromised!
PepperShaker::Application.config.secret_key_base =
    ENV['SECRET_TOKEN'] || '7e5ab32aa95c5aef23265732f7ded8e2fbbd34a7bbb64b1d70f457dea56fc4d617adba7570b94ac4ef5c829b3171f02c9da07792db64a1382487b0fa5205e9d7'
