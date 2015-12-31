from urllib import urlopen
from bs4 import BeautifulSoup

import MySQLdb

#grab and store all stock codes
def main():
    db = MySQLdb.connect('localhost', 'root', 'Password123', 'stock', charset="utf8" )
    try:
        cursor = db.cursor()
        url = "http://quote.eastmoney.com/stocklist.html"
        stockCodePage = urlopen(url).read()
        soup = BeautifulSoup(stockCodePage.decode('gbk').encode('utf-8'),"html.parser")
        div = soup.select("#quotesearch")
        lis = div[0].select("ul li")

        for li in lis:
            az = li.select("a")
            string = az[len(az) - 1].string
            stockName = string[:len(string)-8]
            stockCode = string[len(string)-7:len(string)-1]
            stockBelong = stockCode[:1]

            if (stockBelong == '0' or stockBelong == '3' or stockBelong == '6') and len(stockCode) == 6:
                sql = "INSERT INTO stock_list(stock_name,stock_code, stock_belong, status) VALUES (%s,%s,%s,%s)"
                params = (stockName.encode('utf-8'),stockCode,stockBelong,0)
                cursor.execute(sql,params)

        db.commit()

    finally:
        if db:
            db.close()

if __name__ == '__main__':
    main()