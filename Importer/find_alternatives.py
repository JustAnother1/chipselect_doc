#!/usr/bin/python3
# -*- coding: utf-8 -*-

import ucdb_sql

def showAllEntries():
    allData = ucdb_sql.fetchAll("SELECT * FROM p_architecture")
    print("ID | name | Alternative")
    for row in allData:
        print(str(row[0]) + ' | ' + str(row[1]) + ' | ' + str(row[2]))

def insertNewAlternativeMapping():    
    print("Insert ID of double entry:", end = '')
    alt_id = input()
    allData = ucdb_sql.fetchAll("SELECT * FROM p_architecture where id = " + alt_id)
    print('You selected : ' + str(allData))
    print('Insert ID of original entry:', end = '')
    orig_id = input()
    allData = ucdb_sql.fetchAll("SELECT * FROM p_architecture where id = " + orig_id)
    print('You selected : ' + str(allData))
    print('Is this correct ?(y/n)')
    execute = input()
    if 'y' == execute:
        sql = "UPDATE p_architecture set alternative = " + orig_id + " where id = " + alt_id        
        print('TODO ' + sql)
        ucdb_sql.executeSql(sql)
        allData = ucdb_sql.fetchAll("SELECT * FROM pl_architecture where arch_id = " + alt_id)
        print('all mappings selected : ' + str(allData))
        for map in allData:
            sql = "UPDATE pl_architecture set arch_id = " + orig_id + " where dev_id = " + str(map[0])
            print(sql)
            ucdb_sql.executeSql(sql)
    else:
        print('Canceled!')
    

#ucdb_sql.connect2localDB()
ucdb_sql.connect2remoteDB()

while True:
    print('1: show all Entries; 2: add alternative; q: exit')
    cmd = input()
    if '1' == cmd:
        showAllEntries()
    elif '2' == cmd:
        insertNewAlternativeMapping()
    elif 'q' == cmd:
        break;
    else:
        print('unsupported command: ' + cmd)
    

ucdb_sql.closeDB()
print("Done!")
