//
//  LinkedList.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 03/03/26.
//


class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    func append(_ value: T) {
        let newNode = Node(value: value)
        
        guard let head = head else {
            self.head = newNode
            return
        }
        
        var current = head
        while current.next != nil {
            current = current.next!
        }
        
        current.next = newNode
        tail = newNode
    }
    
    func insertAtBegining(value: T) {
        let newNode = Node(value: value)
        newNode.next = head
        head = newNode
    }
    
    func insertAtEnd(value: T) {
        let newNode = Node(value: value)
        tail?.next = newNode
        tail = newNode
    }
    
    func insert(index: Int, value: T) {
        var currentIndex = 0
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head = newNode
            return
        }
        
        var currentNode = head
        
        while currentNode != nil {
            if currentIndex == index {
                currentNode?.next = currentNode
                currentNode = newNode
            }
            currentIndex += 1
        }
    }
    
    func printList() {
        var current = head
        while current != nil {
            print(current?.value ?? 0)
            current = current?.next
        }
    }
    
}



