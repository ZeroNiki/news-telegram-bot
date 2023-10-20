require 'telegram/bot'
require 'sqlite3'

token = 'TOKEN'
db = SQLite3::Database.open('news.db')

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")

    when '/5_news'
      news = db.execute('SELECT * FROM main LIMIT 5')

      news.each do |n|
        bot.api.sendMessage(chat_id: message.chat.id, text: "#{n[0]}\n\n#{n[1]}")
      end

    when '/all_news'
      news = db.execute('SELECT * FROM main')

      news.each do |n|
        bot.api.sendMessage(chat_id: message.chat.id, text: "#{n[0]}\n\n#{n[1]}")
      end

    end
  end
end
