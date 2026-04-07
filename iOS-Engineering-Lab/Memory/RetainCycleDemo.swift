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
        let b = B()
    }
    
    func deinitDemo() {
        dad = nil
    }
}


class A {
    var closure: (() -> Void)?

    func setup() {
        let value = "Local"
        closure = { [weak self] in
            print(value)
            print(self?.value ?? "Nil value")
        }
    }

    var value = "global"

    deinit {
        print("A deinit")
    }
}


class B {
    init() {
        var obj: A? = A()
        obj?.setup()
        
        let c = obj?.closure
        obj = nil
        
        c?()
    }
}
