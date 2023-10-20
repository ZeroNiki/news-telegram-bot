# Ruby telegram bot (En)

Telegram bot written in Ruby. Parses news from the site [Hacker News](https://news.ycombinator.com/) and saves it to the sqlite3 database

## Installation

Clone the repository:
```
git clone https://github.com/ZeroNiki/news-telegram-bot.git
```

Before starting, install `nokogiri`, `sqlite3`, `httparty`, `json`, `telegram-bot-ruby` using __gem__


Creating a database:
```
ruby scrape.rb
```

Paste your telegram bot token here:
```ruby
token = "Your token"
```


Launch the bot:
```
ruby main.rb
```
