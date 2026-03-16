//
//  iOS_Engineering_LabApp.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 03/03/26.
//

import SwiftUI

@main
struct iOS_Engineering_LabApp: App {
    var body: some Scene {
        WindowGroup {
            StepsViewController()
                .onAppear {
                    linkedList()
                }
        }
        
    }
    
    func linkedList() {
        let list = LinkedList<Int>()
        list.append(10)
        list.append(20)
        list.append(30)
        //list.printList()

        list.insertAtBegining(value: 100)
        list.insertAtEnd(value: 200)
        list.insert(index: 4, value: 300)

        list.printList()

    }
}
