//
//  MergeSortedList.swift
//  Arithmetic
//
//  Created by Alonso on 2018/8/6.
//  Copyright © 2018 Alonso. All rights reserved.
//

import Foundation

func mergeSortedList(_ nums1: [Int], _ nums2: [Int]) -> [Int]{
    var resultarray = [Int](repeatElement(0, count: nums1.count + nums2.count))
    var end = nums1.count + nums2.count - 1
    var m = nums1.count - 1, n = nums2.count - 1
    while m >= 0 && n >= 0 {
        if nums1[m] > nums2[n] {
            resultarray[end] = nums1[m]
            end -= 1
            m -= 1
        } else {
            resultarray[end] = nums2[n]
            end -= 1
            n -= 1
        }
    }
    while n >= 0 {
        resultarray[end] = nums2[n]
        end -= 1
        n -= 1
    }
    while m >= 0 {
        resultarray[end] = nums1[m]
        end -= 1
        m -= 1
    }
    return resultarray
}
