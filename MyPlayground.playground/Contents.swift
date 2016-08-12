//: Playground - noun: a place where people can play

import Cocoa
var n = 10

for var k = n - 1; k >= 0; k-- {
    print(k)
}

for k in (0...(n - 1)).reverse() {
    print(k)
}