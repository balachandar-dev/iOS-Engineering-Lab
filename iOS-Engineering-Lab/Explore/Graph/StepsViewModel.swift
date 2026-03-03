//
//  StepsViewModel.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 03/03/26.
//

import Foundation
import Combine

final class StepsViewModel: ObservableObject {
    
    @Published var stepData: [StepData] = []
    
    init() {
        loadSampleData()
    }
    
    private func loadSampleData() {
        let calendar = Calendar.current
        let today = Date()
        
        stepData = (0..<5).map { offset in
            let date = calendar.date(byAdding: .day, value: -offset, to: today)!
            return StepData(
                date: date,
                steps: Int.random(in: 4000...12000)
            )
        }.reversed()
    }
    
    var averageSteps: Int {
        guard !stepData.isEmpty else { return 0 }
        let total = stepData.reduce(0) { $0 + $1.steps }
        return total / stepData.count
    }
}
