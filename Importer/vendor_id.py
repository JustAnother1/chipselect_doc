#!/usr/bin/python3
# -*- coding: utf-8 -*-

import pymysql.cursors
import sys
import ucdb_sql

mariadb_connection = None
cursor = None


def connect2remoteDB():
    global cursor
    global mariadb_connection
    mariadb_connection = pymysql.connect(host='example.com', port=3306, user='username', password='password', database='database', ssl={'verify-server-cert' : '', 'ca' : 'ca.pem', 'key' : 'key.pem', 'cert' : 'cert.pem'}, charset='utf8mb4')
    mariadb_connection.encoding = 'utf8mb4'
    cursor = mariadb_connection.cursor()
    cursor.execute('SET NAMES utf8mb4;')
    cursor.execute('SET CHARACTER SET utf8mb4;')
    cursor.execute('SET character_set_connection=utf8mb4;')
    initCache()

def connect2localDB():
    global cursor
    global mariadb_connection
    mariadb_connection = pymysql.connect(host='localhost', port=3306, user='user', password='password', database='database', charset='utf8mb4')
    mariadb_connection.encoding = 'utf8mb4'
    # pymysql.set_character_set('utf8')
    #mariadb_connection.set_character_set('utf8')
    cursor = mariadb_connection.cursor()
    cursor.execute('SET NAMES utf8mb4;')
    cursor.execute('SET CHARACTER SET utf8mb4;')
    cursor.execute('SET character_set_connection=utf8mb4;')
    initCache()

def closeDB():
    global mariadb_connection
    mariadb_connection.commit()
    mariadb_connection.close()



def updateDevice(dev_id, vend_id):
    global cursor
    sql = "UPDATE `microcontroller` SET vendor_id = " + str(vend_id)
    sql = sql + ' WHERE id = ' + str(dev_id)
    rows = cursor.execute(sql)


def removeLookup():
    sql = "SELECT dev_id, vendor_id FROM pl_vendor"
    try:
        rows = cursor.execute(sql)
    except pymysql.err.ProgrammingError as err:
        print('SQL : ' + sql)
        print("SQL error: {0}".format(err))
        sys.exit(5)

    result = cursor.fetchall()
    for row in result:
        updateDevice(row[0], row[1])

#connect2localDB()
connect2remoteDB()
removeLookup()
closeDB()
print("Done!")
