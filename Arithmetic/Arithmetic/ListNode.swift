//
//  ListNode.swift
//  LeetCode
//
//  Created by Alonso on 2018/8/2.
//  Copyright © 2018 Alonso. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseList(head: ListNode?) -> ListNode? {
    var temp: ListNode?
    var first = head
    while first != nil {
        let second = first!.next
        first!.next = temp
        temp = first
        first = second
    }
    return temp
}

func reverseList(_ head: ListNode?) -> ListNode? {
    guard let h = head, let next = h.next else {
        return head
    }
    let node = reverseList(next)
    next.next = h
    h.next = nil
    return node
}

func createListNode(_ list:[Int]) -> ListNode?{
    if list.count == 0 {
        return nil;
    }
    let head = ListNode(list.first!)
    var node = head;
    for i in 1..<list.count {
        node.next = ListNode(list[i])
        node = node.next!
    }
    return head;
}

func printListNode(_ listHead:ListNode?) -> String{
    var head = listHead!
    var resStr = ""
    while head.next != nil {
        resStr = resStr.appending(" " + String(head.val))
        head = head.next!
    }
    //apend last one
    resStr = resStr.appending(" " + String(head.val))
    return resStr;
}
