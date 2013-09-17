WebsocketRails::EventMap.describe do
  subscribe :new_message, :to => ChatController, :with_method => :new_message
end
