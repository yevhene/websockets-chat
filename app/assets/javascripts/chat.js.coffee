jQuery ->
  window.chatController = new Chat.Controller($('#chat').data('uri'), true);

window.Chat = {}

class Chat.Controller
  template: (message) ->
    html =
      """
      <div class="post panel panel-default">
        <div class="panel-heading name">
          <span class="panel-title">
            #{message.name}
          </span>
          <span class="panel-date pull-right">
            #{message.created_at}
          </span>
        </div>
        <div class="text panel-body">
            #{message.text}
        </div>
      """
    $(html)

  constructor: (url, useWebSockets) ->
    @dispatcher = new WebSocketRails(url, useWebSockets)
    @bindEvents()

  bindEvents: =>
    @dispatcher.bind 'new_message', @newMessage
    $('#send').on 'click', @sendMessage
    $('#text').keypress (e) => @sendMessage(e) if e.keyCode == 13

  newMessage: (message) =>
    @appendMessage message

  sendMessage: (event) =>
    event.preventDefault()
    name = $('#name').val()
    text = $('#text').val()
    @dispatcher.trigger 'new_message', { name: name, text: text }
    $('#text').val('')

  appendMessage: (message) ->
    messageTemplate = @template(message)
    $('#chat').prepend messageTemplate
