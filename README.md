# Ruby telegram bot (Ru)

[EN doc](https://github.com/ZeroNiki/news-telegram-bot/blob/main/EN.md)

Телеграм бот написаный на Ruby. Парсит новости из сайта [Hacker News](https://news.ycombinator.com/) и сохраняет в базу данных sqlite3

## Устоновка

Склонируте репозиторий:
```
git clone https://github.com/ZeroNiki/news-telegram-bot.git
```

перед запуском устоновите `nokogiri`, `sqlite3`, `httparty`, `json`, `telegram-bot-ruby` при помощи __gem__


Создание бд:
```
ruby scrape.rb
```

Создайте файл __token.rb__ и создайте переменую с названием __TOKEN__:
```ruby
TOKEN = 'Ваш токен'
```


Запуск бота:
```
ruby main.rb
```

