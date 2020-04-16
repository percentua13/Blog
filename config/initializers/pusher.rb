# config/initializers/pusher.rb
require 'pusher'

Pusher.app_id = '983510'
Pusher.key = 'b864afef54978f2238da'
Pusher.secret = '80a118b80c8a8cdbb4a'
Pusher.cluster = 'eu'
Pusher.logger = Rails.logger
Pusher.encrypted = true