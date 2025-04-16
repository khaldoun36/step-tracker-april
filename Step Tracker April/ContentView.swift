//
//  ContentView.swift
//  Step Tracker April
//
//  Created by khaldoun alnuaimi on 4/16/25.
//

import SwiftUI

struct ContentView: View {
    enum HealthMetricContext: CaseIterable, Identifiable {
        case steps, weight
        var id: Self { self }
        var title: String {
            switch self {
            case .steps:
                return "Steps"
            case .weight:
                return "Weight"
            }
        }

        var color: Color {
            switch self {
            case .steps:
                return .pink
            case .weight:
                return .indigo
            }
        }
    }

    @State private var selectedStat: HealthMetricContext = .steps

    var body: some View {
        NavigationStack {
            ScrollView {
                Picker("Selected Stat", selection: $selectedStat) {
                    ForEach(HealthMetricContext.allCases) { metric in Text(metric.title) }
                }
                .pickerStyle(.segmented)
                .padding(.bottom, 16)
//                Primary Container
                VStack(spacing: 16) {
                    NavigationLink(value: selectedStat) {
                        CardContainerView(
                            iconName: "figure.walk",
                            title: "Steps",
                            subTitle: "Avg: 10K Steps"
                        )
                    }
                    .buttonStyle(.plain)
                    CardContainerView(
                        iconName: "calendar",
                        title: "Averages",
                        subTitle: "Last 28 Days"
                    )
                }
            }
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self) { metric in Text(metric.title)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .tint(selectedStat.color)
    }
}

#Preview {
    ContentView()
}
