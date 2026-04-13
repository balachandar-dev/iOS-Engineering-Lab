//
//  ContentView.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 03/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
//            let retain = RetainCycleDemo()
//            retain.deinitDemo()
            let twoPointer = TwoPointer()
            let outpute = twoPointer.getMinDistance([1,2,3,4,5], 4, 3)
            print(outpute)
        }
    }
}

#Preview {
    ContentView()
}
