class LanguageBot < SlackRubyBot::Bot
  # leave it empty for now
   command 'hello' do |client, data, match|
     I18n.locale = :vi
     text = I18n.t "hello", user: data.user
     client.say(text: text, channel: data.channel)
   end
end
