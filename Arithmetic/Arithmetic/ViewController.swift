//
//  ViewController.swift
//  Arithmetic
//
//  Created by Alonso on 2018/8/6.
//  Copyright © 2018 Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //字符串反转
        print(reverseString("Hello"))
        
        //链表反转
        let l1 = createListNode([5,4,3,2,1])
        print(printListNode(reverseList(l1)))
        let l2 = createListNode([4,3,2,1])
        print(printListNode(reverseList(head: l2)))
        
        //有序数组合并
        let nums1 = [1,4,7]
        let nums2 = [4,5,6,8]
        
        print(mergeSortedList(nums1,nums2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

