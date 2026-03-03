//
//  StepsViewController.swift
//  iOS-Engineering-Lab
//
//  Created by Balachandar on 03/03/26.
//

import SwiftUI
import Charts

struct StepsViewController: View {
    
    @StateObject private var viewModel = StepsViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Weekly Steps")
                .font(.title2)
                .bold()
            
            Chart(viewModel.stepData) { item in
                
                BarMark(
                    x: .value("Day", item.date, unit: .day),
                    y: .value("Steps", item.steps)
                )
                .annotation(position: .top) {
                    Text("\(item.steps)")
                        .font(.caption2)
                }
            }
            .frame(height: 300)
            .chartYAxisLabel("Steps")
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { value in
                    AxisValueLabel(format: .dateTime.weekday(.abbreviated))
                }
            }
            .padding(.horizontal)
            
            Text("Average: \(viewModel.averageSteps) steps")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
