import re
import time

from urllib import urlopen
from bs4 import BeautifulSoup

import MySQLdb

#grab all stock history data and store them in separate table by their belongings

stockBelong = '0'
pattern = re.compile('^(\d|\-)+$')
f=open("D:\grab_stock_history_data_"+stockBelong+"_task_log_20151230.txt", "a")
db = MySQLdb.connect('localhost', 'root', 'Password123', 'stock', charset="utf8")
cursor = db.cursor()

def handleOne(year, jidu, sql):
    url = "".join(["http://money.finance.sina.com.cn/corp/go.php/vMS_MarketHistory/stockid/", stock, ".phtml?year=",
             str(year), "&jidu=", str(jidu)])
    page = urlopen(url).read()
    soup = BeautifulSoup(page.decode('gbk').encode('utf-8'), "html.parser")
    tables = soup.select("#FundHoldSharesTable")

    if tables and len(tables) > 0:  # means we have history data to grab
        myPrint(str(year)+"-"+str(jidu)+" has data")
        trs = tables[0].select("tr")
        for tr in trs:
            divs = tr.select('div')
            if divs and len(divs) > 0 and (len(divs[0].select('a')) > 0 or pattern.match(divs[0].string.strip())):  # make sure it is the data line
                trade_date = divs[0].select('a')[0].string.strip() if len(divs[0].select('a')) == 1 else divs[0].string.strip()
                params = (stock, trade_date, int(float(divs[1].string) * 1000),
                          int(float(divs[2].string) * 1000), int(float(divs[3].string) * 1000),
                          int(float(divs[4].string) * 1000), divs[5].string, divs[6].string)
                cursor.execute(sql, params)


def grabHistoryDataTask(stock, stockBelong):
    tableName = 'history_data_' + stockBelong
    sql = "INSERT INTO " + tableName + " (stock_code, trade_date, open_price, highest_price,close_price, lowest_price, volume, amount) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"

    #year 1990-2015
    #season 1-4
    try:
        normalFinishFlag = True
        for year in range(1989, 2016):
            time.sleep(0.5)  # lower visit frequency
            for jidu in range(1, 5):
                try:
                    handleOne(year, jidu, sql)
                except:
                    myPrint(stock+" : "+str(year)+"."+str(jidu)+" store data failed")
                    normalFinishFlag = False
            db.commit()
        db.commit()
        if normalFinishFlag == True:
            updateStatus(stock)
        myPrint("handle stock:" + stock + " finished. normalFinishFlag:" + str(normalFinishFlag))
    except:
        pass


def getStockCodes(stockBelong):
    stockList = []
    sql = "select stock_code from stock_list where stock_belong=" + stockBelong + " and status = 0"
    cursor.execute(sql)
    rows = cursor.fetchall()
    for row in rows:
        stockList.append(row[0])
    return stockList


def updateStatus(stock):
    try:
        sql = "update stock_list set status = 1 where stock_code = " + stock
        cursor.execute(sql)
        db.commit()
    except:
        myPrint("update "+stock+" status=1 failed")


def closeDb(cursor, db):
    if cursor:
        cursor.close()
    if db:
        db.close()

def myPrint(str):
    print str
    print >>f,str

if __name__ == '__main__':
    try:
        stockList = getStockCodes(stockBelong)
        for stock in stockList:
            myPrint('=======================')
            myPrint('handling ' + str(stockList.index(stock)) + '/' + str(len(stockList)) + ' stock:' + stock)
            grabHistoryDataTask(stock, stockBelong)
    finally:
        closeDb(cursor,db)
        f.close()
