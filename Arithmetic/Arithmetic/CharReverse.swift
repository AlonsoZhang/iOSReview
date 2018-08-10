//
//  CharReverse.swift
//  Arithmetic
//
//  Created by Alonso on 2018/8/6.
//  Copyright © 2018 Alonso. All rights reserved.
//

import Foundation

func reverseString(_ s: String) -> String {
    var begin = 0
    var end = s.count - 1
    var chars = Array(s)
    while begin <= end {
        let char = chars[begin]
        chars[begin] = chars[end]
        chars[end] = char
        begin += 1
        end -= 1
    }
    //return String(s.reversed())
    
    return String(chars)
}
