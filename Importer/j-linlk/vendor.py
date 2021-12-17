#!/usr/bin/python3
# -*- coding: utf-8 -*-
import sys


if __name__ == '__main__':

     vendors = []
     with open('jlink_dev_list', 'rt') as f:
         data = f.readlines()
         for line in data:
             parts = line.split('", ')
             vend = parts[0]
             vend = vend[1:]
             if vend not in vendors:
                 vendors = vendors + [vend]
     print(str(vendors))