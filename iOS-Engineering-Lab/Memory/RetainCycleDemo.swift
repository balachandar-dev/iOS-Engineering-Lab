//
//  Retain.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 04/04/26.
//

class Parent {
    var child: Child?
    
    init(child: Child?) {
        self.child = child
        print("initialized dad")
    }
    deinit {
        print("Parent deinit")
    }
}

class Child {
    weak var parent: Parent?
    
    init(parent: Parent?) {
        self.parent = parent
        print("initialized son")

    }
    
    deinit {
        print("Child deinit")
    }
    
}


class RetainCycleDemo {
    var dad: Parent?
    var son: Child?
    
    init() {
        dad = Parent(child: nil)
        son = Child(parent: nil)
        dad?.child = son
        son?.parent = dad
    }
    
    func deinitDemo() {
        dad = nil
    }
}
