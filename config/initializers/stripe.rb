Rails.configuration.stripe = {
  :stripe_public_key => ENV['STRIPE_PUBLIC_KEY'],
  :stripe_secret_key      => ENV['STRIPE_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:stripe_secret_key]