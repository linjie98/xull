#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author   : linjie

'''
改用协程，生产者生产消息后，直接通过yield跳转到消费者开始执行，待消费者执行完毕后，切换回生产者继续生产，效率极高：
'''

import time

# 函数定义中包含yield 则这个函数不是普通函数，而是generator（生成器）
def consumer(name):
    print("consumer : {0}".format(name))
    while True:
        n = yield # 暂停 （接收下面的send发送的数据，接收到数据之后才会继续执行）
        print("consumer ----- n 和 name：{0},{1}".format(n,name))


def producer(name):
    c = consumer("消费者")
    c.__next__() # next用于唤醒yield ，但不传递值
    for i in range(4):
        time.sleep(1)
        print("producer ------ i 和 name:{0},{1}".format(i,name))
        c.send(i)

if __name__ == '__main__':
    producer("生产者")


'''
consumer : 消费者
producer ------ i 和 name:0,生产者
consumer ----- n 和 name：0,消费者
producer ------ i 和 name:1,生产者
consumer ----- n 和 name：1,消费者
producer ------ i 和 name:2,生产者
consumer ----- n 和 name：2,消费者
producer ------ i 和 name:3,生产者
consumer ----- n 和 name：3,消费者
'''