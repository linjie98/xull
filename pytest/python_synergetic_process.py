#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author   : linjie
# 使用python第三方协程包，实现从一个协程到另一个协程的显示切换
from greenlet import greenlet

def test1():
    print(11)
    gr2.switch()
    print(22)
    gr2.switch()
def test2():
    print(33)
    gr1.switch()
    print(44)

gr1 = greenlet(test1)
gr2 = greenlet(test2)
gr1.switch()

'''
11
33
22
44
'''