class ChatController < WebsocketRails::BaseController
  include ActionView::Helpers::SanitizeHelper

  def initialize_session
    puts "Session Initialized"
  end

  def new_message
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    puts message
    m = Message.new(name: message[:name], text: message[:text])
    if m.save
      puts 'Okj'
      broadcast_message :new_message, {
        name: m.name,
        created_at: m.created_at,
        text: ERB::Util.html_escape(m.text)
      }
    end
  end

end
