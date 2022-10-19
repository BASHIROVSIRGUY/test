# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class LivesportparserItem(scrapy.Item):
    match_id = scrapy.Field()
    minute = scrapy.Field()
    category_name = scrapy.Field()
    home = scrapy.Field()
    away = scrapy.Field()
