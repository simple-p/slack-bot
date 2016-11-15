class LanguageBot < SlackRubyBot::Bot
  # leave it empty for now
   command 'hello' do |client, data, match|

     user = User.find_or_create_by(username: data.user)
#     binding.pry 
     I18n.locale = user.locale
     text = I18n.t "hello", user: data.user
     client.say(text: text, channel: data.channel)
   end

   command "language" do |client, data, match|
     user = User.find_or_create_by(username: data.user)
     if match[:expression]
        user.locale = match[:expression]
        user.save!
     end
     text = "Change language to #{user.locale} for <@%{user}>"
     client.say(text: text, channel: data.channel)
   end

end
