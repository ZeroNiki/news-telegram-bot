require 'telegram/bot'
require 'sqlite3'

require_relative 'token'
require_relative 'scrape'

token = TOKEN

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    db = SQLite3::Database.open('news.db')

    start_text = "Hello, #{message.from.first_name}! usage:\n/5_news - last 5 news;\n/all_news - all news from db;\n/update_db - update db"
    case message.text
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: start_text)

    when '/all_news'
      news = db.execute('SELECT title, url FROM main')

      news.each do |n|
        bot.api.sendMessage(chat_id: message.chat.id, text: "#{n[0]}\n\n#{n[1]}")
      end

    when '/5_news'
      news = db.execute('SELECT title, url FROM main LIMIT 5')

      news.each do |n|
        bot.api.sendMessage(chat_id: message.chat.id, text: "#{n[0]}\n\n#{n[1]}")
      end

    when '/update_db'
      create_db
      bot.api.sendMessage(chat_id: message.chat.id, text: 'DB has been updated')

    end
  end
end
