require 'celluloid/autostart'

module Wisper
  class CelluloidBroadcaster
    def broadcast(subscriber, publisher, event, args)
      subscriber.async.public_send(event, *args)
    end

    def self.register
      Wisper.configure do |config|
        config.broadcaster :celluloid, CelluloidBroadcaster.new
        config.broadcaster :async,     CelluloidBroadcaster.new
      end
    end
  end
end

Wisper::CelluloidBroadcaster.register
