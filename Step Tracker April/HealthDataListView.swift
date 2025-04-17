//
//  HealthDataListView.swift
//  Step Tracker April
//
//  Created by khaldoun alnuaimi on 4/17/25.
//

import SwiftUI

struct HealthDataListView: View {
    let metric: ContentView.HealthMetricContext
    @State private var isSheetPresented: Bool = false
    @State private var date: Date = .now
    @State private var value: String = ""
    var body: some View {
        List(0 ..< 100) { i in
            HStack {
                Text(
                    Date(),
                    format: .dateTime
                        .month(.abbreviated).day().year())
                Spacer()
                Text(10000 + i, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isSheetPresented) {
            addDataView
        }
        .toolbar {
            Button("Add data", systemImage: "plus") {
                isSheetPresented.toggle()
            }
        }
    }

    var addDataView: some View {
        NavigationStack {
            Form {
                DatePicker("Date", selection: $date, displayedComponents: .date)
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $value)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 100)
                        .keyboardType(metric == .steps ? .numberPad : .decimalPad)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Text("Dismiss")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Text("Add")
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataListView(metric: .steps)
    }
}
