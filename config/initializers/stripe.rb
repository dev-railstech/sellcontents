#if Rails.env.development?
Stripe.api_key = "sk_test_dqeVzRfdSFUO3xCvgMA1JQcu"
STRIPE_PUBLIC_KEY = "pk_test_mD6g9sjsCQr3ouoqYZOnvKio"
#else
#  Stripe.api_key = "sk_live_8ZXJNlckSuZJwegajRRaTzE7"
#  STRIPE_PUBLIC_KEY = "pk_live_3LFBjd7TXvzB0fmXOJgBAXTh"
#end

