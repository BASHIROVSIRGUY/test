from scrapy.linkextractors import LinkExtractor
from scrapy.spiders import CrawlSpider, Rule
from livesportParser import items
import re


class FootballSpider(CrawlSpider):
    name = 'football'
    allowed_domains = ['m.flashscore.ru.com']
    start_urls = ['https://m.flashscore.ru.com/?s=2']

    rules = (
        Rule(LinkExtractor(
            allow=('match',), restrict_css='a.live'),
            follow=True
        ),
        Rule(LinkExtractor(
            allow=('match-statistics',)),
            callback='parse_item',
        ),
    )

    def parse_item(self, response):
        category_row_css = '.stat__row'
        math_id = re.search(r'match\/(\w{8})\/', response.url)[1]
        minute = re.search(r'\D(\d+)\'', response.css('span.live::text').get())[1]
        rows_info = [
            response.css(f'{category_row_css} div.stat__categoryName::text').getall(),
            response.css(f'{category_row_css} div.stat__homeValue::text').getall(),
            response.css(f'{category_row_css} div.stat__awayValue::text').getall(),
        ]
        for category_name, category_value_home, category_value_away in zip(*rows_info):
            item = items.LivesportparserItem()
            item['match_id'] = math_id
            item['minute'] = minute
            item['category_name'] = category_name
            item['home'] = category_value_home
            item['away'] = category_value_home
            yield item
