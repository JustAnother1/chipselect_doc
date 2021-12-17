#!/usr/bin/python3
# -*- coding: utf-8 -*-

import pymysql.cursors
import sys

mariadb_connection = None
cursor = None
cached_architectures = None
cached_market_states = None
cached_packages = None
cached_vendors = None

def initCache():
    global cached_architectures
    cached_architectures = {}
    global cached_market_states
    cached_market_states =  {}
    global cached_packages
    cached_packages = {}
    global cached_vendors
    cached_vendors = {}

def fetchAll(sql):
    rows = cursor.execute(sql)
    print("got " + str(rows) + " rows!")
    result = cursor.fetchall()
    return result

def executeSql(sql):
    rows = cursor.execute(sql)
    print('rows: ' + str(rows))

def escapeStringForSql(str):
    res = str.replace('\\', '\\\\')
    res = res.replace('"', '\\"')
    res = res.replace("'", "\\'")
    res = res.replace("\n", " ")
    res = res.replace("\r", " ")
    return res

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

def createNewDevice(dev):
    global cursor
    col = ""
    val = ""    

    if 'name' in dev.keys():
        col = col + 'name, ' 
        val = val + '"' + str(dev['name']) + '", '
    if 'CPU_clock_max_MHz' in dev.keys():
        col = col + 'CPU_clock_max_MHz, '
        val = val + '"' + str(dev['CPU_clock_max_MHz']) + '", '
    if 'Flash_size_kB' in dev.keys():
        col = col + 'Flash_size_kB, '
        val = val + '"' + str(dev['Flash_size_kB']) + '", '
    if 'RAM_size_kB' in dev.keys():
        col = col + 'RAM_size_kB, '
        val = val + '"' + str(dev['RAM_size_kB']) + '", '
    if 'Supply_Voltage_min_V' in dev.keys():
        col = col + 'Supply_Voltage_min_V, '
        val = val + '"' + str(dev['Supply_Voltage_min_V']) + '", '
    if 'Supply_Voltage_max_V' in dev.keys():
        col = col + 'Supply_Voltage_max_V, '
        val = val + '"' + str(dev['Supply_Voltage_max_V']) + '", '
    if 'Operating_Temperature_min_degC' in dev.keys():
        col = col + 'Operating_Temperature_min_degC, '
        val = val + '"' + str(dev['Operating_Temperature_min_degC']) + '", '
    if 'Operating_Temperature_max_degC' in dev.keys():
        col = col + 'Operating_Temperature_max_degC, '
        val = val + '"' + str(dev['Operating_Temperature_max_degC']) + '", '
    
    col = col[:-2]
    val = val[:-2]
    sql = 'INSERT INTO microcontroller (' + col + ') VALUES(' + val + ')'

    #print(sql)

    rows = cursor.execute(sql)
    if 0 == rows:
        return False;
    else:
        return True

def updateDevice(dev, id):
    global cursor
    sql = "UPDATE `microcontroller` SET "
    if 'name' in dev.keys():
        sql = sql + 'name = "' + str(dev['name']) + '", '  
    if 'CPU_clock_max_MHz' in dev.keys():
        sql = sql + 'CPU_clock_max_MHz = "' + str(dev['CPU_clock_max_MHz']) + '", '  
    if 'Flash_size_kB' in dev.keys():
        sql = sql + 'Flash_size_kB = "' + str(dev['Flash_size_kB']) + '", '  
    if 'RAM_size_kB' in dev.keys():
        sql = sql + 'RAM_size_kB = "' + str(dev['RAM_size_kB']) + '", '  
    if 'Supply_Voltage_min_V' in dev.keys():
        sql = sql + 'Supply_Voltage_min_V = "' + str(dev['Supply_Voltage_min_V']) + '", '  
    if 'Supply_Voltage_max_V' in dev.keys():
        sql = sql + 'Supply_Voltage_max_V = "' + str(dev['Supply_Voltage_max_V']) + '", '  
    if 'Operating_Temperature_min_degC' in dev.keys():
        sql = sql + 'Operating_Temperature_min_degC = "' + str(dev['Operating_Temperature_min_degC']) + '", '  
    if 'Operating_Temperature_max_degC' in dev.keys():
        sql = sql + 'Operating_Temperature_max_degC = "' + str(dev['Operating_Temperature_max_degC']) + '", '  
    
    sql = sql[:-2]
    sql = sql + ' WHERE id = ' + str(id)

    rows = cursor.execute(sql)
    return True

def putInfoIntoMicroncontrollerTable(dev):
    res = True
    sql = "SELECT id FROM microcontroller WHERE name ='" + dev['name'] + "'"
    try:
        rows = cursor.execute(sql)
    except pymysql.err.ProgrammingError as err:
        print('SQL : ' + sql)
        print("SQL error: {0}".format(err))
        sys.exit(5)

    if 0 == rows:
        res = createNewDevice(dev)
    else:
        result = cursor.fetchone()
        if None == result:
            print("create device")
            res = createNewDevice(dev)
        else:
            print("update device")
            res = updateDevice(dev, result[0])
    return res

def addDeviceToDatabase(dev):
    global cursor
    if None == dev:
        return False
    #print("extracted the device : " + str(dev))
    #print("device = " + dev['name'])
    # microcontroller
    dev['name'] = escapeStringForSql(dev['name'])
    if False == putInfoIntoMicroncontrollerTable(dev):
        return False
    sql = "SELECT id FROM microcontroller WHERE name ='" + dev['name'] + "'"
    rows = cursor.execute(sql)
    result = cursor.fetchone()
    microcontroller_id = result[0]
    # Architecture
    arch_id = 0
    if 'Architecture' in dev.keys():
        global cached_architectures
        if dev['Architecture'] in cached_architectures.keys():
            # take ID from cache
            arch_id = cached_architectures[dev['Architecture']]
        else:
            # check if Architecture is in database
            sql = "SELECT id FROM p_architecture WHERE name ='" + dev['Architecture'] + "'"
            rows = cursor.execute(sql)
            if 0 == rows:
                # a new architecture
                sql = 'INSERT INTO p_architecture (name) VALUES ("' + dev['Architecture'] + '")'
                rows = cursor.execute(sql)
                sql = "SELECT id FROM p_architecture WHERE name ='" + dev['Architecture'] + "'"
                rows = cursor.execute(sql)
            result = cursor.fetchone()
            arch_id = result[0]
        # update lookup table
        sql = 'INSERT IGNORE INTO pl_architecture (dev_id, arch_id) VALUES(' + str(microcontroller_id) + ', ' + str(arch_id) + ')'
        rows = cursor.execute(sql)

    # market state
    market_id = 0
    if 'MarketState' in dev.keys():
        global cached_market_states
        if dev['MarketState'] in cached_market_states.keys():
            # take ID from cache
            market_id = cached_market_states[dev['MarketState']]
        else:
            # check if market state is in database
            sql = "SELECT id FROM p_market_state WHERE name ='" + dev['MarketState'] + "'"
            rows = cursor.execute(sql)
            if 0 == rows:
                # a new market state
                sql = 'INSERT INTO p_market_state (name) VALUES ("' + dev['MarketState'] + '")'
                rows = cursor.execute(sql)
                sql = "SELECT id FROM p_market_state WHERE name ='" + dev['MarketState'] + "'"
                rows = cursor.execute(sql)
            result = cursor.fetchone()
            market_id = result[0]
        # update lookup table
        sql = 'INSERT IGNORE INTO pl_market_state (dev_id, market_state_id) VALUES(' + str(microcontroller_id) + ', ' + str(market_id) + ')'
        rows = cursor.execute(sql)

    # Package
    package_id = 0
    if 'Package' in dev.keys():
        packs = dev['Package'].split(',')
        for pkg in packs:
            global cached_packages
            if pkg in cached_packages.keys():
                # take ID from cache
                package_id = cached_packages[pkg]
            else:
                # check if package is in database
                sql = "SELECT id FROM p_package WHERE name ='" + pkg + "'"
                rows = cursor.execute(sql)
                if 0 == rows:
                    # a new package
                    sql = 'INSERT INTO p_package (name) VALUES ("' + pkg + '")'
                    rows = cursor.execute(sql)
                    sql = "SELECT id FROM p_package WHERE name ='" + pkg + "'"
                    rows = cursor.execute(sql)
                result = cursor.fetchone()
                package_id = result[0]
            # update lookup table
            sql = 'INSERT IGNORE INTO pl_package (dev_id, package_id) VALUES(' + str(microcontroller_id) + ', ' + str(package_id) + ')'
            rows = cursor.execute(sql)

    # Vendor
    vendor_id = 0
    if 'Vendor' in dev.keys():
        global cached_vendors
        if dev['Vendor'] in cached_vendors.keys():
            # take ID from cache
            vendor_id = cached_vendors[dev['Vendor']]
        else:
            # check if Vendor is in database
            sql = "SELECT id FROM p_vendor WHERE name ='" + dev['Vendor'] + "'"
            rows = cursor.execute(sql)
            if 0 == rows:
                # a new Vendor
                sql = 'INSERT INTO p_vendor (name) VALUES ("' + dev['Vendor'] + '")'
                rows = cursor.execute(sql)
                sql = "SELECT id FROM p_vendor WHERE name ='" + dev['Vendor'] + "'"
                rows = cursor.execute(sql)
            result = cursor.fetchone()
            vendor_id = result[0]
        # update lookup table
        sql = 'INSERT IGNORE INTO pl_vendor (dev_id, vendor_id) VALUES(' + str(microcontroller_id) + ', ' + str(vendor_id) + ')'
        rows = cursor.execute(sql)


    return True


