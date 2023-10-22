require 'httparty'
require 'nokogiri'
require 'sqlite3'
require 'json'

def create_db
  db = SQLite3::Database.new('news.db')
  db.execute('CREATE TABLE IF NOT EXISTS main(id integer primary key autoincrement, title string, url string)')

  request = HTTParty.get('https://news.ycombinator.com/newest')

  document = Nokogiri::HTML.parse(request.body)

  all_news = document.css('td.title')

  title_news ||= []
  href_news ||= []

  all_news.each do |news|
    get_data = news.css('span.titleline')
    news_title = get_data.css('a').text.chomp

    get_href = get_data.css('a').map { |link| link['href'] }

    title_news << news_title
    href_news << get_href[0]
  end

  clear_title = title_news.reject { |title| title.empty? }

  clear_title.zip(href_news.compact).each do |title, href|
    db.execute('INSERT INTO MAIN(title, url) VALUES(?, ?)', title, href)
  end
end
