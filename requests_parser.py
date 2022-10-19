import re
import requests
from bs4 import BeautifulSoup

session = requests.Session()
main_href = 'https://m.flashscore.ru.com'
response = session.get(main_href + '/??d=0&s=3')

parse_obj = BeautifulSoup(response.content, 'html.parser')

result = []

for a in parse_obj.find_all('a', 'live'):
    try:
        item_href = a.get('href')
        response_item = session.get(main_href + item_href + '&t=match-statistics')
        parse_obj_item = BeautifulSoup(response_item.content.decode('utf8'), 'html.parser')
        category_row_css = '.stat__row'
        if len(parse_obj_item.select(f'{category_row_css}')):
            math_id = re.search(r'match\/(\w{8})\/', item_href)[1]
            minute = re.search(r'\D(\d+)\'', parse_obj_item.find_all('span', 'live')[1].text)[1]
            rows_info = [
                parse_obj_item.select(f'{category_row_css} div.stat__categoryName'),
                parse_obj_item.select(f'{category_row_css} div.stat__homeValue'),
                parse_obj_item.select(f'{category_row_css} div.stat__awayValue'),
            ]
            for category_name, category_value_home, category_value_away in zip(*rows_info):
                item = {}
                item['match_id'] = math_id
                item['minute'] = minute
                item['category_name'] = category_name.text
                item['home'] = category_value_home.text
                item['away'] = category_value_away.text
                result.append(item)
    except Exception as e:
        print(e)
        continue
