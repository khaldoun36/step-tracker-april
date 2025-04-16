//
//  ContentView.swift
//  Step Tracker April
//
//  Created by khaldoun alnuaimi on 4/16/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
//                Primary Container
                VStack(spacing: 16) {
                    CardContainerView(
                        iconName: "figure.walk",
                        title: "Steps",
                        subTitle: "Avg: 10K Steps",
                        onTap: {
                            print("hello world")
                        }
                    )
                    CardContainerView(
                        iconName: "calendar",
                        title: "Averages",
                        subTitle: "Last 28 Days",
                        onTap: nil
                    )
                }
            }
            .navigationTitle("Dashboard")
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
    }
}

#Preview {
    ContentView()
}
